/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_email_service.dart';

class LoginScreenEmailViewError extends StatelessWidget {
  static const String _text = "Please enter a valid email";

  @override
  Widget build(BuildContext context) {
    LoginScreenEmailService service =
        Provider.of<LoginScreenEmailService>(context);
    return Opacity(
      opacity: service.model.isError ? 1.0 : 0.0,
      child: Text(_text,
          style: TextStyle(
              fontSize: service.style.size(15),
              fontWeight: FontWeight.w600,
              fontFamily: service.style.textFamily,
              color: service.style.errorColor)),
    );
  }
}
