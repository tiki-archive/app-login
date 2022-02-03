/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'screen_email_controller.dart';
import 'screen_email_model.dart';
import 'screen_email_presenter.dart';
import 'screen_email_style.dart';

class ScreenEmailService extends ChangeNotifier {
  final ScreenEmailStyle style;
  final ScreenEmailModel model;
  late final ScreenEmailPresenter presenter;
  late final ScreenEmailController controller;

  ScreenEmailService(this.style, {bool isError = false})
      : model = ScreenEmailModel(isError: isError) {
    controller = ScreenEmailController(this);
    presenter = ScreenEmailPresenter(this);
  }

  void setEmail(String email) {
    model.email = email;
    model.canSubmit = EmailValidator.validate(email);
    notifyListeners();
  }

  void setError(bool isError) {
    model.isError = isError;
    notifyListeners();
  }
}
