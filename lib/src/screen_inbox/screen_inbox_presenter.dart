/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen_inbox_service.dart';
import 'ui/screen_inbox_layout.dart';

class ScreenInboxPresenter extends Page {
  final ScreenInboxService service;

  ScreenInboxPresenter(this.service) : super(key: const ValueKey("ScreenInbox"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: service, child: ScreenInboxLayout()));
  }
}
