/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'screen_intro_view.dart';

class ScreenIntroView2 extends ScreenIntroView {
  const ScreenIntroView2({Key? key}) : super(key: key);

  @override
  Color get background => ColorProvider.lightYellow;

  @override
  String get button => 'NEXT';

  @override
  int get pos => 1;

  @override
  String get subtitle =>
      'You can also choose to earn money from your data. This is optional.';

  @override
  String get title => 'Start earning money';
}
