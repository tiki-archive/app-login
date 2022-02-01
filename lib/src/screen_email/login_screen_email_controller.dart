/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/src/flow/login_flow_service.dart';
import 'package:login/src/screen_terms/login_screen_terms_service.dart';
import 'package:provider/provider.dart';

import 'login_screen_email_service.dart';

class LoginScreenEmailController {
  final LoginScreenEmailService service;

  LoginScreenEmailController(this.service);

  submitLogin() async => await service.submitEmail();

  emailChanged(BuildContext context, String input) =>
      service.onEmailChange(input);

  void tos(BuildContext context) {
    LoginFlowStyle style =
        Provider.of<LoginFlowService>(context, listen: false).style;
    Navigator.of(context).push(LoginScreenTermsService('login_screen_terms_tos',
            LoginScreenTermsStyle.mqd(style.terms, MediaQuery.of(context)))
        .presenter
        .createRoute(context));
  }

  void privacy(BuildContext context) {
    LoginFlowStyle style =
        Provider.of<LoginFlowService>(context, listen: false).style;
    Navigator.of(context).push(LoginScreenTermsService(
            'login_screen_terms_privacy',
            LoginScreenTermsStyle.mqd(style.terms, MediaQuery.of(context)))
        .presenter
        .createRoute(context));
  }
}
