/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:login/src/flow/login_flow_style.dart';

import 'login_flow_controller.dart';
import 'login_flow_presenter.dart';
import 'model/login_flow_model.dart';

class LoginFlowService extends ChangeNotifier {
  final LoginFlowStyle style;
  final LoginFlowModel model = LoginFlowModel();
  late final LoginFlowController controller;
  late final LoginFlowPresenter presenter;

  LoginFlowService(this.style) {
    controller = LoginFlowController(this);
    presenter = LoginFlowPresenter(this);
  }
}
