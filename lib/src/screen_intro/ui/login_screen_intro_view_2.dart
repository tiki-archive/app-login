/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import 'login_screen_intro_view.dart';

class LoginScreenIntroView2 extends LoginScreenIntroView {
  @override
  Color get background => style.backgroundColor2;

  @override
  String get button => 'NEXT';

  @override
  int get pos => 2;

  @override
  String get subtitle =>
      'You can also choose to earn money from your data. This is optional.';

  @override
  String get title => 'Start earning money';
}