/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import 'login_screen_inbox_controller.dart';
import 'login_screen_inbox_model.dart';
import 'login_screen_inbox_presenter.dart';
import 'login_screen_inbox_style.dart';

class LoginScreenInboxService extends ChangeNotifier {
  final LoginScreenInboxStyle style;
  final LoginScreenInboxModel model;
  late final LoginScreenInboxPresenter presenter;
  late final LoginScreenInboxController controller;
  //final LoginFlowService loginFlowService;

  LoginScreenInboxService(this.style, String? email) //, this.loginFlowService)
      : model = LoginScreenInboxModel(email: email) {
    controller = LoginScreenInboxController(this);
    presenter = LoginScreenInboxPresenter(this);
  }

  //Future<void> resendEmail() async => await this.loginFlowService.requestOtp();
}
