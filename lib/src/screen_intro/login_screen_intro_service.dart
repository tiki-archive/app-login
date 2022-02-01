/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import 'login_screen_intro_controller.dart';
import 'login_screen_intro_model.dart';
import 'login_screen_intro_presenter.dart';
import 'login_screen_intro_style.dart';

class LoginScreenIntroService extends ChangeNotifier {
  final LoginScreenIntroStyle style;
  final LoginScreenIntroModel model = LoginScreenIntroModel();
  late LoginScreenIntroPresenter presenter;
  late LoginScreenIntroController controller;

  LoginScreenIntroService(this.style) {
    presenter = LoginScreenIntroPresenter(this);
    controller = LoginScreenIntroController(this);
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
