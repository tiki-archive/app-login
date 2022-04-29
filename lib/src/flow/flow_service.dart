/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';

import '../api_bouncer/api_bouncer_service.dart';
import '../api_bouncer/model/api_bouncer_model_jwt_rsp.dart';
import '../api_bouncer/model/api_bouncer_model_otp_rsp.dart';
import 'flow_controller.dart';
import 'flow_presenter.dart';
import 'flow_style.dart';
import 'model/flow_model.dart';
import 'model/flow_model_otp.dart';
import 'model/flow_model_state.dart';
import 'model/flow_model_token.dart';
import 'model/flow_model_user.dart';
import 'repository/flow_repository.dart';

class FlowService extends ChangeNotifier {
  final Logger _log = Logger('FlowService');
  final FlowStyle style;
  final FlowModel model = FlowModel();
  final FlowRepository _repository;
  late final FlowController controller;
  late final FlowPresenter presenter;
  late final ApiBouncerService _bouncer;
  final Httpp _httpp;
  final Page _home;

  FlowService(
      {required this.style,
      required Page home,
      Httpp? httpp,
      FlutterSecureStorage? secureStorage})
      : _httpp = httpp ?? Httpp(),
        _home = home,
        _repository = FlowRepository(secureStorage: secureStorage) {
    controller = FlowController(this);
    presenter = FlowPresenter(this);
    _bouncer = ApiBouncerService(httpp: _httpp);
    FirebaseDynamicLinks.instance.onLink
        .listen((data) => _dynamicLinkHandler(data.link))
        .onError((error) => _log.severe(error));
    FirebaseDynamicLinks.instance.getInitialLink().then((initialLink) {
      final Uri? link = initialLink?.link;
      if (link != null) _dynamicLinkHandler(link);
    });
  }

  Httpp get httpp => _httpp;

  Page get home => _home;

  void changeState(FlowModelState state) {
    model.state = state;
    notifyListeners();
  }

  Future<void> setToken(FlowModelToken token) async {
    model.token = await _repository.saveToken(model.current!.email!, token);
    notifyListeners();
  }

  Future<void> requestOtp(String email) async {
    model.otp = FlowModelOtp(email: email);
    await _bouncer.otp(
        email: email,
        onSuccess: (rsp) async {
          model.otpError = false;
          model.otp = FlowModelOtp(
              email: email, salt: (rsp.data as ApiBouncerModelOtpRsp).salt);
          await _repository.saveOtp(model.otp!);
          notifyListeners();
        },
        onError: (error) {
          _log.warning(error);
          model.state = FlowModelState.returningUser;
          model.otpError = true;
          notifyListeners();
        });
  }

  Future<void> login({String? address}) async {
    model.user = await _repository.saveUser(FlowModelUser(
        email: model.current?.email,
        isLoggedIn: true,
        address: address ?? model.user?.address));
    model.loginCallbacks.forEach((key, func) => func());
    model.state = FlowModelState.loggedIn;
    notifyListeners();
  }

  void addLogoutCallback(String id, void Function() callback) {
    if (!model.logoutCallbacks.containsKey(id)) {
      model.logoutCallbacks[id] = callback;
    }
  }

  void addLoginCallback(String id, void Function() callback) {
    if (!model.loginCallbacks.containsKey(id)) {
      model.loginCallbacks[id] = callback;
    }
  }

  Future<void> logout() async {
    if (model.user != null && model.user?.isLoggedIn == true) {
      model.user!.isLoggedIn = false;
      model.user = await _repository.saveUser(model.user!);
    }
    model.logoutCallbacks.forEach((key, func) => func());
    model.state = FlowModelState.returningUser;
    notifyListeners();
  }

  Future<void> refresh(void Function(String?)? onComplete) async {
    if (model.token?.refresh != null) {
      await _bouncer.refresh(
          refreshToken: model.token!.refresh!,
          onSuccess: (rsp) async {
            ApiBouncerModelJwtRsp jwt = rsp.data;
            model.token = await _repository.saveToken(
                model.current!.email!,
                FlowModelToken(
                    bearer: jwt.accessToken,
                    refresh: jwt.refreshToken,
                    expires: jwt.expiresIn != null
                        ? DateTime.now().add(Duration(seconds: jwt.expiresIn!))
                        : null));
            notifyListeners();
            if (onComplete != null) onComplete(jwt.accessToken);
          },
          onError: (error) {
            _log.warning('Failed to refresh token. Logging out', error);
            if (onComplete != null) onComplete(null);
            //log out
          });
    } else {
      _log.warning('No refresh token. Logging out');
      if (onComplete != null) onComplete(null);
      // log out
    }
  }

  Future<void> loadModel() => _repository.get().then((saved) async {
        model.current = saved.current;
        model.otp = saved.otp;
        model.token = saved.token;
        model.user = saved.user;
        if (model.user?.isLoggedIn == true) {
          model.state = FlowModelState.loggedIn;
          model.loginCallbacks.forEach((key, func) => func());
        } else if (model.current?.email != null) {
          model.state = FlowModelState.returningUser;
        }
        notifyListeners();
      });

  Future<void> _dynamicLinkHandler(Uri link) async {
    const String dlPathBouncer = "/app/bouncer";
    if (link.path == dlPathBouncer) {
      String? otp = link.queryParameters["otp"];
      if (otp != null && otp.isNotEmpty) _verifyOtp(otp);
    }
  }

  Future<void> _verifyOtp(String otp) async {
    if (model.user?.isLoggedIn != true && model.otp?.salt != null) {
      return _bouncer.token(
          otp: otp,
          salt: model.otp!.salt!,
          onSuccess: (rsp) async {
            ApiBouncerModelJwtRsp data = rsp.data;
            model.token = FlowModelToken(
                bearer: data.accessToken,
                refresh: data.refreshToken,
                expires: data.expiresIn != null
                    ? DateTime.now().add(Duration(seconds: data.expiresIn!))
                    : null);
            model.current = await _repository.saveCurrent(model.otp!.email!);
            model.token =
                await _repository.saveToken(model.otp!.email!, model.token!);
            model.user = await _repository.getUser(model.otp!.email!);
            if (model.user?.address != null) {
              await login();
            } else {
              model.state = FlowModelState.otpVerified;
            }
            notifyListeners();
          },
          onError: (error) => _log.severe(error));
    }
  }
}
