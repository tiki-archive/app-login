/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import 'login_flow_service.dart';
import 'model/login_flow_model_state.dart';

class LoginFlowController {
  final LoginFlowService _service;

  LoginFlowController(this._service);

  //logout
  //pop
  //showXyz
  //login

  void showScreenEmail() =>
      _service.changeState(LoginFlowModelState.returningUser);
  void showScreenInbox() =>
      _service.changeState(LoginFlowModelState.otpRequested);

  bool pop(Route<dynamic> route, result) {
    if (!route.didPop(result)) return false;

    if (_service.model.state == LoginFlowModelState.otpRequested)
      showScreenEmail();

    //TODO check if we need/want to explicitly exit the app on back btn.
    return true;
  }
}
