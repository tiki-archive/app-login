/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'login_screen_email_style.dart';

import 'login_screen_email_controller.dart';
import 'login_screen_email_model.dart';
import 'login_screen_email_presenter.dart';

class LoginScreenEmailService extends ChangeNotifier {
  final LoginScreenEmailStyle style;
  late final LoginScreenEmailModel model;
  late final LoginScreenEmailPresenter presenter;
  late final LoginScreenEmailController controller;
  //final LoginFlowService loginFlowService;

  LoginScreenEmailService(this.style, /*this.loginFlowService*/) {
    model = LoginScreenEmailModel();
    controller = LoginScreenEmailController(this);
    presenter = LoginScreenEmailPresenter(this);
  }

  void onEmailChange(String email) {
    this.model.email = email;
    //this.model.canSubmit = EmailValidator.validate(this.model.email);
    notifyListeners();
  }

  Future<void> submitEmail() async {
    if (this.model.canSubmit) {
      this.model.isError = false;
      /*bool res =
          await this.loginFlowService.requestOtp(email: this.model.email);
      if (!res) this.model.isError = true;*/
      notifyListeners();
    }
  }
}
