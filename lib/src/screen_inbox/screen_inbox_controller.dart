/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../flow/flow_service.dart';
import 'screen_inbox_service.dart';

class ScreenInboxController {
  final ScreenInboxService service;

  ScreenInboxController(this.service);

  void back(BuildContext context) =>
      Provider.of<FlowService>(context, listen: false).controller.showLogin();

  Future<void> resend(BuildContext context) {
    FlowService flowService = Provider.of<FlowService>(context, listen: false);
    return flowService.requestOtp(flowService.model.otp!.email!);
  }
}
