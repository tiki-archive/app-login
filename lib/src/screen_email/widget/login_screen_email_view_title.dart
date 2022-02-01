/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_email_service.dart';
import '../login_screen_email_style.dart';

class LoginScreenEmailViewTitle extends StatelessWidget {
  static const String _text = "Hey, nice to see you here";

  @override
  Widget build(BuildContext context) {
    LoginScreenEmailStyle style =
        Provider.of<LoginScreenEmailService>(context).style;
    return Text(_text,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: style.titleFamily,
            color: style.titleColor,
            fontSize: style.text(28),
            fontWeight: FontWeight.bold));
  }
}
