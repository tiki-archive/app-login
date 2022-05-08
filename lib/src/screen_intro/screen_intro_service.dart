/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import 'screen_intro_controller.dart';
import 'screen_intro_model.dart';
import 'screen_intro_presenter.dart';

class ScreenIntroService extends ChangeNotifier {
  final ScreenIntroModel model = ScreenIntroModel();
  late ScreenIntroPresenter presenter;
  late ScreenIntroController controller;

  ScreenIntroService() {
    presenter = ScreenIntroPresenter(this);
    controller = ScreenIntroController(this);
  }

  void moveToNextScreen() {
    model.currentCard++;
    notifyListeners();
  }

  void moveToPreviousScreen() {
    model.currentCard--;
    notifyListeners();
  }

  void skipToLogin() {
    model.shouldMoveToLogin = true;
    notifyListeners();
  }
}
