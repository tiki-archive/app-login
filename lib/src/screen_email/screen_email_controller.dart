/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../flow/flow_service.dart';
import '../screen_terms/screen_terms_service.dart';
import 'screen_email_service.dart';

class ScreenEmailController {
  final ScreenEmailService _service;

  ScreenEmailController(this._service);

  Future<void> submit(BuildContext context) =>
      Provider.of<FlowService>(context, listen: false)
          .controller
          .requestOtp(_service.model.email!);

  onChanged(String input) => _service.setEmail(input);

  void tos(BuildContext context) {
    Navigator.of(context).push(ScreenTermsService('screen_terms_tos')
        .presenter
        .createRoute(context));
  }

  void privacy(BuildContext context) {
    Navigator.of(context).push(ScreenTermsService('screen_terms_privacy')
        .presenter
        .createRoute(context));
  }
}
