/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../flow/flow_service.dart';
import 'screen_intro_service.dart';

class ScreenIntroController {
  final ScreenIntroService service;

  ScreenIntroController(this.service);

  void navigateToNextScreen(context) {
    if (service.model.currentCard < (service.model.totalCards - 1)) {
      service.moveToNextScreen();
    } else {
      skipToLogin(context);
    }
  }

  void navigateToPreviousScreen(context) {
    if (service.model.currentCard != 0) {
      service.moveToPreviousScreen();
    }
  }

  void skipToLogin(context) =>
      Provider.of<FlowService>(context, listen: false).controller.showLogin();

  void onHorizontalDrag(BuildContext context, DragEndDetails dragEndDetails) {
    if (dragEndDetails.primaryVelocity! < 0) navigateToNextScreen(context);
    if (dragEndDetails.primaryVelocity! > 0) navigateToPreviousScreen(context);
  }
}
