/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import 'screen_inbox_controller.dart';
import 'screen_inbox_model.dart';
import 'screen_inbox_presenter.dart';

class ScreenInboxService extends ChangeNotifier {
  final ScreenInboxModel model;
  late final ScreenInboxPresenter presenter;
  late final ScreenInboxController controller;

  ScreenInboxService(String? email) //, this.FlowService)
      : model = ScreenInboxModel(email: email) {
    controller = ScreenInboxController(this);
    presenter = ScreenInboxPresenter(this);
  }
}
