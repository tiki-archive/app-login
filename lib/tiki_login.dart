/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:httpp/httpp.dart';

import 'src/flow/flow_service.dart';
import 'src/flow/flow_style.dart';
import 'src/flow/model/flow_model_token.dart';
import 'src/flow/model/flow_model_user.dart';

export 'src/flow/flow_style.dart';
export 'src/flow/model/flow_model_token.dart';
export 'src/flow/model/flow_model_user.dart';
export 'src/modal_recover/modal_recover_style.dart';
export 'src/screen_email/screen_email_style.dart';
export 'src/screen_inbox/screen_inbox_style.dart';
export 'src/screen_intro/screen_intro_style.dart';
export 'src/screen_terms/screen_terms_style.dart';

class TikiLogin {
  final FlowService _flowService;

  TikiLogin(
      {FlowStyle? style,
      Httpp? httpp,
      required Page home,
      FlutterSecureStorage? secureStorage})
      : _flowService = FlowService(
            style: style ?? FlowStyle(),
            httpp: httpp ?? Httpp(),
            home: home,
            secureStorage: secureStorage ?? const FlutterSecureStorage());

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
