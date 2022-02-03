/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';

import 'src/flow/flow_service.dart';
import 'src/flow/flow_style.dart';

export 'src/flow/flow_style.dart';
export 'src/modal_recover/modal_recover_style.dart';
export 'src/screen_email/screen_email_style.dart';
export 'src/screen_inbox/screen_inbox_style.dart';
export 'src/screen_intro/screen_intro_style.dart';
export 'src/screen_terms/screen_terms_style.dart';

class Login {
  final Logger _log = Logger('Login');
  //take in the home page
  //provider init func
  //refresh token method
  //get user
  //logout callbacks
  final FlowService _flowService;

  Login({FlowStyle? style, Httpp? httpp})
      : _flowService = FlowService(style ?? FlowStyle(), httpp: httpp);

  RouterDelegate get routerDelegate => _flowService.presenter;

  Future<Login> init() async {
    await _flowService.loadModel();
    return this;
  }
}
