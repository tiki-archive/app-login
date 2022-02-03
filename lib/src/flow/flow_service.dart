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
import 'repository/flow_repository.dart';

class FlowService extends ChangeNotifier {
  final Logger _log = Logger('FlowService');
  final FlowStyle style;
  final FlowModel model = FlowModel();
  final FlowRepository _repository;
  late final FlowController controller;
  late final FlowPresenter presenter;
  final ApiBouncerService _bouncer;
  final Httpp? httpp;

  FlowService(this.style, {this.httpp, FlutterSecureStorage? secureStorage})
      : _bouncer = ApiBouncerService(httpp: httpp),
        _repository = FlowRepository(secureStorage: secureStorage) {
    controller = FlowController(this);
    presenter = FlowPresenter(this);
    FirebaseDynamicLinks.instance.onLink
        .listen((data) => _dynamicLinkHandler(data.link))
        .onError((error) => _log.severe(error));
    FirebaseDynamicLinks.instance.getInitialLink().then((initialLink) {
      final Uri? link = initialLink?.link;
      if (link != null) _dynamicLinkHandler(link);
    });
  }

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

  void login(String? address) {}

  Future<void> refresh(Function(String?)? onComplete) async {
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

  Future<void> loadModel() => _repository.get().then((saved) {
        model.current = saved.current;
        model.otp = saved.otp;
        model.token = saved.token;
        model.user = saved.user;
        if (model.current?.email != null)
          model.state = FlowModelState.returningUser;
        //todo "logged in"
        notifyListeners();
      });

  Future<void> _dynamicLinkHandler(Uri link) async {
    final String dlPathBouncer = "/app/bouncer";
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
              //log in.
              print('should log in');
            } else
              model.state = FlowModelState.otpVerified;
            notifyListeners();
          },
          onError: (error) => _log.severe(error));
    }
  }

//how to launch modal (in layout?)

//save/login method (set current)

//logout method

//load returning on startup
}
