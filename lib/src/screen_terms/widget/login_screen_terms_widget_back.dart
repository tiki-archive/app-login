/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/login_utils_icons.dart';
import '../login_screen_terms_service.dart';

class LoginScreenTermsWidgetBack extends StatelessWidget {
  static const String _textBack = "Back";

  @override
  Widget build(BuildContext context) {
    LoginScreenTermsService service =
        Provider.of<LoginScreenTermsService>(context, listen: false);
    return TextButton(
      onPressed: () => service.controller.back(context),
      child: Row(children: [
        Container(
          child: Icon(LoginUtilsIcons.back, size: service.style.text(15)),
          margin: EdgeInsets.only(right: service.style.size(15)),
        ),
        Text(_textBack,
            style: TextStyle(
                fontFamily: service.style.textFamily,
                color: service.style.linkColor,
                fontWeight: FontWeight.w800,
                fontSize: service.style.text(15)))
      ]),
    );
  }
}
