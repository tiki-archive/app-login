/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:amplitude_flutter/amplitude.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:httpp/httpp.dart';

import 'src/flow/flow_service.dart';
import 'src/flow/model/flow_model_token.dart';
import 'src/flow/model/flow_model_user.dart';

export 'src/flow/model/flow_model_token.dart';
export 'src/flow/model/flow_model_user.dart';

class TikiLogin {
  final FlowService _flowService;

  TikiLogin(
      {Httpp? httpp, required Page home, Amplitude? amplitude, FlutterSecureStorage? secureStorage})
      : _flowService = FlowService(
            httpp: httpp ?? Httpp(), home: home, amplitude: amplitude, secureStorage: secureStorage);

  RouterDelegate get routerDelegate => _flowService.presenter;

  Future<void> init() => _flowService.loadModel();

  void onLogout(String id, void Function() callback) =>
      _flowService.addLogoutCallback(id, callback);

  void onLogin(String id, void Function() callback) =>
      _flowService.addLoginCallback(id, callback);

  FlowModelUser? get user => _flowService.model.user;

  FlowModelToken? get token => _flowService.model.token;

  Future<void> refresh(void Function(String?)? onComplete) =>
      _flowService.refresh(onComplete);

  Future<void> logout() => _flowService.logout();
}
