/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen_email_service.dart';
import 'ui/screen_email_layout.dart';

class ScreenEmailPresenter extends Page {
  final ScreenEmailService service;

  ScreenEmailPresenter(this.service) : super(key: ValueKey("ScreenEmail"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: service, child: ScreenEmailLayout()));
  }
}
