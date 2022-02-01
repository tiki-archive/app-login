/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'login_screen_terms_controller.dart';
import 'login_screen_terms_model.dart';
import 'login_screen_terms_presenter.dart';
import 'login_screen_terms_style.dart';

class LoginScreenTermsService extends ChangeNotifier {
  final LoginScreenTermsStyle style;
  final LoginScreenTermsModel model;
  late final LoginScreenTermsPresenter presenter;
  late final LoginScreenTermsController controller;

  LoginScreenTermsService(String filename, this.style)
      : model = LoginScreenTermsModel(filename: filename) {
    presenter = LoginScreenTermsPresenter(this);
    controller = LoginScreenTermsController(this);
  }

  void setFile(String filename) {
    model.filename = filename;
    notifyListeners();
  }
}
