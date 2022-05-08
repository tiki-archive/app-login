/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'screen_intro_view.dart';

class ScreenIntroView1 extends ScreenIntroView {
  const ScreenIntroView1({Key? key}) : super(key: key);

  @override
  Color get background => ColorProvider.yellow;

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
