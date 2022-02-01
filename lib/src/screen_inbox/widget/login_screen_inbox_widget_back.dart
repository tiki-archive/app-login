/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_inbox_service.dart';
import 'login_screen_inbox_widget_icons.dart';

class LoginScreenInboxWidgetBack extends StatelessWidget {
  static const String _text = "Back";

  @override
  Widget build(BuildContext context) {
    LoginScreenInboxService service =
        Provider.of<LoginScreenInboxService>(context, listen: false);
    return TextButton(
      onPressed: () => service.controller.back(),
      child: Row(children: [
        Container(
          child: Icon(LoginScreenInboxWidgetIcons.back,
              size: service.style.textSize),
          margin: EdgeInsets.only(right: service.style.size(1)),
        ),
        Text(_text,
            style: TextStyle(
                color: service.style.buttonColor,
                fontFamily: service.style.textFamily,
                fontWeight: FontWeight.w800,
                fontSize: service.style.textSize))
      ]),
    );
  }
}
