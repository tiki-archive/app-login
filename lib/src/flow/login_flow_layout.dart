/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:login/src/screen_email/login_screen_email_service.dart';
import 'package:login/src/screen_inbox/login_screen_inbox_service.dart';
import 'package:login/src/screen_intro/login_screen_intro_service.dart';
import 'package:provider/provider.dart';

import '../../login.dart';
import 'login_flow_service.dart';
import 'model/login_flow_model_state.dart';

class LoginFlowLayout extends StatelessWidget {
  final GlobalKey? navigatorKey;

  LoginFlowLayout({this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    LoginFlowService service = Provider.of<LoginFlowService>(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Navigator(
      key: navigatorKey,
      pages: [
        LoginScreenIntroService(
                LoginScreenIntroStyle.mqd(service.style.intro, mediaQueryData))
            .presenter,
        if (service.model.state == LoginFlowModelState.returningUser)
          LoginScreenEmailService(LoginScreenEmailStyle.mqd(
                  service.style.email, mediaQueryData))
              .presenter
        else if (service.model.state == LoginFlowModelState.otpRequested)
          LoginScreenInboxService(
                  LoginScreenInboxStyle.mqd(
                      service.style.inbox, mediaQueryData),
                  service.model.otp?.email)
              .presenter
        /*else if (service.model.state == LoginFlowModelState.loggedIn)
          HomeScreenService(providers: service.provide()).presenter*/
      ],
      onPopPage: service.controller.pop,
    );
  }
}
