/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import 'login_flow_service.dart';

class LoginFlowController {
  final LoginFlowService _service;

  LoginFlowController(this._service);

  //logout
  //pop
  //showXyz
  //login

  bool pop(Route<dynamic> route, result) {
    if (!route.didPop(result)) return false;

    //if (_service.model.state == LoginFlowModelState.otpRequested)
    //showReturningUser();

    //TODO check if we need/want to explicitly exit the app on back btn.
    return true;
  }
}
