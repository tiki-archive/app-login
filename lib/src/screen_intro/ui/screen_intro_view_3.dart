/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'screen_intro_view.dart';

class ScreenIntroView3 extends ScreenIntroView {
  const ScreenIntroView3({Key? key}) : super(key: key);

  @override
  Color get background => ColorProvider.lightOrange;

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
