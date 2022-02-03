/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screen_terms_controller.dart';
import 'screen_terms_model.dart';
import 'screen_terms_presenter.dart';
import 'screen_terms_style.dart';

class ScreenTermsService extends ChangeNotifier {
  final ScreenTermsStyle style;
  final ScreenTermsModel model;
  late final ScreenTermsPresenter presenter;
  late final ScreenTermsController controller;

  ScreenTermsService(String filename, this.style)
      : model = ScreenTermsModel(filename: filename) {
    presenter = ScreenTermsPresenter(this);
    controller = ScreenTermsController(this);
  }

  void setFile(String filename) {
    model.filename = filename;
    notifyListeners();
  }
}
