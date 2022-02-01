/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_email_service.dart';
import '../login_screen_email_style.dart';

class LoginScreenEmailViewSubtitle extends StatelessWidget {
  static const String _text = "Enter your email below to begin.";

  @override
  Widget build(BuildContext context) {
    LoginScreenEmailStyle style =
        Provider.of<LoginScreenEmailService>(context).style;
    return Text(_text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: style.text(14),
            fontWeight: FontWeight.w600,
            fontFamily: style.textFamily,
            color: style.textColor));
  }
}
