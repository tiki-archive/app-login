/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import '../widget/login_screen_terms_widget_md.dart';
import 'package:provider/provider.dart';

import '../login_screen_terms_service.dart';
import '../login_screen_terms_style.dart';
import '../widget/login_screen_terms_widget_back.dart';

class LoginScreenTermsForeground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginScreenTermsStyle style =
        Provider.of<LoginScreenTermsService>(context, listen: false).style;
    return SafeArea(
        child: Column(children: [
      Container(
          margin: EdgeInsets.only(left: style.size(3)),
          child: LoginScreenTermsWidgetBack()),
      Expanded(
          child: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.only(
                      top: style.size(2),
                      bottom: style.size(12),
                      left: style.size(6),
                      right: style.size(6)),
                  child: LoginScreenTermsWidgetMd())))
    ]));
  }
}
