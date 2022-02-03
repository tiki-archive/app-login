/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import 'screen_intro_view.dart';

class ScreenIntroView1 extends ScreenIntroView {
  @override
  Color get background => style.backgroundColor1;

  @override
  String get button => 'NEXT';

  @override
  int get pos => 0;

  @override
  String get subtitle =>
      'TIKI is a free app that allows you to see, control and monetize your data.';

  @override
  String get title => 'Take control of your data';
}
