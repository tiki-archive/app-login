/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/login_utils_icons.dart';
import '../login_screen_inbox_service.dart';

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
          child: Icon(LoginUtilsIcons.back, size: service.style.text(14)),
          margin: EdgeInsets.only(right: service.style.size(1)),
        ),
        Text(_text,
            style: TextStyle(
                color: service.style.buttonColor,
                fontFamily: service.style.textFamily,
                fontWeight: FontWeight.w800,
                fontSize: service.style.text(14)))
      ]),
    );
  }
}
