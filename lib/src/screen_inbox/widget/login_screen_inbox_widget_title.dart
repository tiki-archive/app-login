/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_inbox_service.dart';
import '../login_screen_inbox_style.dart';

class LoginScreenInboxWidgetTitle extends StatelessWidget {
  static const String _text = "Great, now check your inbox";

  @override
  Widget build(BuildContext context) {
    LoginScreenInboxStyle style =
        Provider.of<LoginScreenInboxService>(context).style;
    return Text(_text,
        style: TextStyle(
            color: style.titleColor,
            fontFamily: style.titleFamily,
            fontSize: style.text(14),
            fontWeight: FontWeight.bold));
  }
}
