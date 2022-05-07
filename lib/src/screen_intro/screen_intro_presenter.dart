/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen_intro_service.dart';
import 'ui/screen_intro_layout.dart';

class ScreenIntroPresenter extends Page {
  final ScreenIntroService service;

  ScreenIntroPresenter(this.service) : super(key: const ValueKey("ScreenIntro"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: service, child: ScreenIntroLayout()));
  }
}
