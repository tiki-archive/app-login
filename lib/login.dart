/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import 'src/flow/login_flow_service.dart';
import 'src/flow/login_flow_style.dart';

export 'src/flow/login_flow_style.dart';
export 'src/screen_email/login_screen_email_style.dart';
export 'src/screen_inbox/login_screen_inbox_style.dart';
export 'src/screen_intro/login_screen_intro_style.dart';
export 'src/screen_terms/login_screen_terms_style.dart';

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
