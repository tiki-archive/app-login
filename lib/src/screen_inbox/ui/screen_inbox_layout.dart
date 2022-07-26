/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../flow/flow_service.dart';
import '../../flow/model/flow_model_state.dart';
import '../../modal_recover/modal_recover_service.dart';
import '../../modal_recover/model/modal_recover_model_state.dart';
import 'screen_inbox_background.dart';
import 'screen_inbox_foreground.dart';

class ScreenInboxLayout extends StatelessWidget {
  const ScreenInboxLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlowService service = Provider.of<FlowService>(context);
    if (service.model.state == FlowModelState.otpVerified) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        service.changeState(FlowModelState.setupKeys);
        ModalRecoverService(
                ModalRecoverModelState(
                    email: service.model.current?.email,
                    accessToken: service.model.token?.bearer),
                refresh: service.refresh,
                httpp: service.httpp,
                amplitude: service.amplitude)
            .presenter
            .show(context);
      });
    }
    return Scaffold(
        body: Center(
            child: Stack(children: const [
      ScreenInboxBackground(),
      ScreenInboxForeground(),
    ])));
  }
}
