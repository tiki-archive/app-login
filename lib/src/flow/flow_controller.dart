/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import 'flow_service.dart';
import 'model/flow_model_state.dart';

class FlowController {
  final FlowService _service;

  FlowController(this._service);

  //logout
  //pop
  //showXyz
  //

  void showLogin() => _service.changeState(FlowModelState.returningUser);

  Future<void> requestOtp(String email) {
    _service.changeState(FlowModelState.otpRequested);
    return _service.requestOtp(email);
  }

  bool pop(Route<dynamic> route, result) {
    if (!route.didPop(result)) return false;

    if (_service.model.state == FlowModelState.otpRequested) showLogin();

    //TODO check if we need/want to explicitly exit the app on back btn.
    return true;
  }
}
