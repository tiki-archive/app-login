/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_intro_service.dart';
import '../login_screen_intro_style.dart';

class LoginScreenIntroWidgetSubtitle extends StatelessWidget {
  final String text;

  LoginScreenIntroWidgetSubtitle(this.text);

  @override
  Widget build(BuildContext context) {
    LoginScreenIntroStyle style =
        Provider.of<LoginScreenIntroService>(context, listen: false).style;
    return Text(text,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: style.textColor,
            fontSize: style.text(20),
            fontWeight: FontWeight.bold,
            fontFamily: style.textFamily,
            height: 1.2));
  }
}
