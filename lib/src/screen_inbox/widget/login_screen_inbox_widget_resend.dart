/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/login_utils_icons.dart';
import '../login_screen_inbox_service.dart';

class LoginScreenInboxWidgetResend extends StatelessWidget {
  static const String _textReceive = "Didn't receive it?";
  static const String _textResend = "Resend now";

  @override
  Widget build(BuildContext context) {
    LoginScreenInboxService service =
        Provider.of<LoginScreenInboxService>(context, listen: false);
    return Row(children: [
      Text(_textReceive,
          style: TextStyle(
              color: service.style.textColor,
              fontSize: service.style.text(14),
              fontWeight: FontWeight.w600,
              fontFamily: service.style.textFamily)),
      TextButton(
          onPressed: () => service.controller.resend(),
          child: Row(children: [
            Container(
                margin: EdgeInsets.only(right: service.style.size(1)),
                child: Text(_textResend,
                    style: TextStyle(
                        fontFamily: service.style.textFamily,
                        fontSize: service.style.text(14),
                        fontWeight: FontWeight.bold,
                        color: service.style.buttonColor))),
            Icon(LoginUtilsIcons.reload, size: service.style.text(14))
          ]))
    ]);
  }
}
