/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_email_service.dart';
import '../login_screen_email_style.dart';
import '../widget/login_screen_email_view_button.dart';
import '../widget/login_screen_email_view_error.dart';
import '../widget/login_screen_email_view_input.dart';
import '../widget/login_screen_email_view_subtitle.dart';
import '../widget/login_screen_email_view_title.dart';
import '../widget/loginl_screen_email_view_tos.dart';

class LoginScreenEmailForeground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginScreenEmailStyle style =
        Provider.of<LoginScreenEmailService>(context).style;
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: style.size(32)),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  margin: EdgeInsets.only(
                      top: style.size(51), right: style.size(60)),
                  alignment: Alignment.centerLeft,
                  child: LoginScreenEmailViewTitle()),
              Container(
                  margin: EdgeInsets.only(top: style.size(15)),
                  alignment: Alignment.centerLeft,
                  child: LoginScreenEmailViewSubtitle()),
              Container(
                  margin: EdgeInsets.only(top: style.size(15)),
                  child: LoginScreenEmailViewInput()),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: style.size(5)),
                  child: LoginScreenEmailViewError()),
              Container(
                  margin: EdgeInsets.only(top: style.size(5)),
                  child: LoginScreenEmailViewButton()),
              Container(
                  margin: EdgeInsets.only(top: style.size(20)),
                  child: LoginScreenEmailViewTos()),
            ])));
  }
}
