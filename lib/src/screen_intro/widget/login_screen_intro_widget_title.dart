/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_intro_service.dart';
import '../login_screen_intro_style.dart';

class LoginScreenIntroWidgetTitle extends StatelessWidget {
  final String text;

  LoginScreenIntroWidgetTitle(this.text);

  @override
  Widget build(BuildContext context) {
    LoginScreenIntroStyle style =
        Provider.of<LoginScreenIntroService>(context).style;
    return Text(text,
        textAlign: TextAlign.left,
        style: TextStyle(
            height: 1.1,
            color: style.textColor,
            fontFamily: style.titleFamily,
            fontSize: style.text(44),
            fontWeight: FontWeight.bold));
  }
}
