/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_intro_service.dart';

class LoginScreenIntroWidgetSkipButton extends StatelessWidget {
  static const String _text = 'Skip';

  @override
  Widget build(BuildContext context) {
    LoginScreenIntroService service =
        Provider.of<LoginScreenIntroService>(context, listen: false);
    return Container(
        child: TextButton(
            onPressed: () => service.controller.skipToLogin(context),
            child: Text(
              _text,
              style: TextStyle(
                color: service.style.skipColor,
                fontWeight: FontWeight.bold,
                fontSize: service.style.text(15),
                fontFamily: service.style.fontFamily,
              ),
            )));
  }
}
