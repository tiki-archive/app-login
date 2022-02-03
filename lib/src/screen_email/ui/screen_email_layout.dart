/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import 'screen_email_background.dart';
import 'screen_email_foreground.dart';

class ScreenEmailLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
            onWillPop: () => Future.value(false),
            child: Center(
                child: Stack(children: [
              ScreenEmailBackground(),
              ScreenEmailForeground()
            ]))));
  }
}
