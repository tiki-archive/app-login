/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_email_service.dart';

class LoginScreenEmailViewButton extends StatelessWidget {
  static const String _text = "CONTINUE";

  @override
  Widget build(BuildContext context) {
    LoginScreenEmailService service =
        Provider.of<LoginScreenEmailService>(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: service.style.size(2),
                horizontal: service.style.size(15)),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(service.style.size(10)))),
            primary: service.style.buttonColor),
        child: Text(_text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: service.style.buttonTextColor,
              fontFamily: service.style.textFamily,
              fontWeight: FontWeight.w800,
              fontSize: service.style.size(30),
              letterSpacing: service.style.size(0.05),
            )),
        onPressed: service.model.canSubmit
            ? () => service.controller.submitLogin()
            : null);
  }
}
