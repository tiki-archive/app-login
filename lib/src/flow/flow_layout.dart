/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../screen_email/screen_email_service.dart';
import '../screen_inbox/screen_inbox_service.dart';
import '../screen_intro/screen_intro_service.dart';
import 'flow_service.dart';
import 'model/flow_model_state.dart';

class FlowLayout extends StatelessWidget {
  final GlobalKey? navigatorKey;

  const FlowLayout({Key? key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlowService service = Provider.of<FlowService>(context);
    return Navigator(
      key: navigatorKey,
      pages: [
        ScreenIntroService().presenter,
        if (service.model.state == FlowModelState.returningUser)
          ScreenEmailService(isError: service.model.otpError).presenter
        else if (service.model.state == FlowModelState.otpRequested ||
            service.model.state == FlowModelState.otpVerified ||
            service.model.state == FlowModelState.setupKeys)
          ScreenInboxService(service.model.otp?.email).presenter
        else if (service.model.state == FlowModelState.loggedIn)
          service.home
      ],
      onPopPage: service.controller.pop,
    );
  }
}
