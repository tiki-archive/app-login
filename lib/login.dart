/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import 'src/flow/login_flow_service.dart';
import 'src/flow/login_flow_style.dart';

class Login {
  //take in the home page
  //provider init func
  //refresh token method
  //get user
  //logout callbacks
  final LoginFlowService _flowService;

  Login({LoginFlowStyle? style})
      : _flowService = LoginFlowService(style ?? LoginFlowStyle());

  RouterDelegate get routerDelegate => _flowService.presenter;
}
