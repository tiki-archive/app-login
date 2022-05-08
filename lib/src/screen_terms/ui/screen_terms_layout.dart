/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import 'screen_terms_background.dart';
import 'screen_terms_foreground.dart';

class ScreenTermsLayout extends StatelessWidget {
  const ScreenTermsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: GestureDetector(
                child: Stack(children: const [
      ScreenTermsBackground(),
      ScreenTermsForeground(),
    ]))));
  }
}
