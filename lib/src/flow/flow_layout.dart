/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../screen_email/screen_email_service.dart';
import '../screen_email/screen_email_style.dart';
import '../screen_inbox/screen_inbox_service.dart';
import '../screen_inbox/screen_inbox_style.dart';
import '../screen_intro/screen_intro_service.dart';
import '../screen_intro/screen_intro_style.dart';
import 'flow_service.dart';
import 'model/flow_model_state.dart';

class FlowLayout extends StatelessWidget {
  final GlobalKey? navigatorKey;

  FlowLayout({this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    FlowService service = Provider.of<FlowService>(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Navigator(
      key: navigatorKey,
      pages: [
        ScreenIntroService(
                ScreenIntroStyle.mqd(service.style.intro, mediaQueryData))
            .presenter,
        if (service.model.state == FlowModelState.returningUser)
          ScreenEmailService(
                  ScreenEmailStyle.mqd(service.style.email, mediaQueryData),
                  isError: service.model.otpError)
              .presenter
        else if (service.model.state == FlowModelState.otpRequested ||
            service.model.state == FlowModelState.otpVerified ||
            service.model.state == FlowModelState.setupKeys)
          ScreenInboxService(
                  ScreenInboxStyle.mqd(service.style.inbox, mediaQueryData),
                  service.model.otp?.email)
              .presenter
        /*else if (service.model.state == FlowModelState.loggedIn)
          HomeScreenService(providers: service.provide()).presenter*/
      ],
      onPopPage: service.controller.pop,
    );
  }
}
