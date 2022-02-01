/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import 'login_screen_terms_background.dart';
import 'login_screen_terms_foreground.dart';

class LoginScreenTermsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: GestureDetector(
                child: Stack(children: [
      LoginScreenTermsBackground(),
      LoginScreenTermsForeground(),
    ]))));
  }
}
