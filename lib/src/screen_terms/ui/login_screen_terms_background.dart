/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_terms_service.dart';
import '../login_screen_terms_style.dart';

class LoginScreenTermsBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginScreenTermsStyle style =
        Provider.of<LoginScreenTermsService>(context, listen: false).style;
    return Stack(children: [
      Center(child: Container(color: style.backgroundColor)),
      Align(
        alignment: Alignment.topRight,
        child: Image.asset("res/images/terms-blob-tr.png", package: 'login'),
      )
    ]);
  }
}
