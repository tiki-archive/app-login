/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_inbox_service.dart';
import '../login_screen_inbox_style.dart';

class LoginScreenInboxBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginScreenInboxStyle style =
        Provider.of<LoginScreenInboxService>(context, listen: false).style;
    return Stack(children: [
      Center(child: Container(color: style.backgroundColor)),
      Align(
          alignment: Alignment.topRight,
          child: Image.asset('res/images/inbox-blob-tr.png',
              height: style.size(15.5), package: 'login')),
      Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset('res/images/inbox-blob-bl.png',
              height: style.size(21), package: 'login')),
    ]);
  }
}
