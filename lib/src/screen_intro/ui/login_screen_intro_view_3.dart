/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import 'login_screen_intro_view.dart';

class LoginScreenIntroView3 extends LoginScreenIntroView {
  @override
  Color get background => style.backgroundColor3;

  @override
  String get button => 'GET STARTED';

  @override
  int get pos => 2;

  @override
  String get subtitle =>
      'You are now part of the TIKI tribe! I’m TIKI and I am here to help you take back your share.';

  @override
  String get title => 'We’re stronger together';
}
