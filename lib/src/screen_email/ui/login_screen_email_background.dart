/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_email_service.dart';
import '../login_screen_email_style.dart';

class LoginScreenEmailBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginScreenEmailStyle style =
        Provider.of<LoginScreenEmailService>(context).style;
    return Stack(children: [
      Center(child: Container(color: style.backgroundColor)),
      Container(
          margin: EdgeInsets.only(top: style.size(2)),
          alignment: Alignment.topRight,
          child: Image.asset(
            'res/images/login-pineapple.png',
            height: style.size(24),
            package: 'login',
          )),
      Container(
          margin: EdgeInsets.only(top: style.size(32)),
          alignment: Alignment.topLeft,
          child: Image.asset(
            'res/images/login-blob.png',
            height: style.size(11.5),
            package: 'login',
          ))
    ]);
  }
}
