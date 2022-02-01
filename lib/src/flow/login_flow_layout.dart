/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:login/src/screen_intro/login_screen_intro_service.dart';
import 'package:provider/provider.dart';

import 'login_flow_service.dart';

class LoginFlowLayout extends StatelessWidget {
  final GlobalKey? navigatorKey;

  LoginFlowLayout({this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    LoginFlowService service = Provider.of<LoginFlowService>(context);
    return Navigator(
      key: navigatorKey,
      pages: getPages(service),
      onPopPage: service.controller.pop,
    );
  }

  List<Page> getPages(LoginFlowService service) {
    return [
      LoginScreenIntroService(service.style.intro).presenter,
      /*if (service.model.state == LoginFlowModelState.returningUser)
        LoginScreenEmailService(service).presenter
      else if (service.model.state == LoginFlowModelState.otpRequested)
        LoginScreenInboxService(service).presenter
      else if (service.model.state == LoginFlowModelState.loggedIn)
        HomeScreenService(providers: service.provide()).presenter*/
    ];
  }
}
