/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_inbox_service.dart';
import '../login_screen_inbox_style.dart';
import '../widget/login_screen_inbox_widget_back.dart';
import '../widget/login_screen_inbox_widget_resend.dart';
import '../widget/login_screen_inbox_widget_sent.dart';
import '../widget/login_screen_inbox_widget_title.dart';

class LoginScreenInboxForeground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginScreenInboxStyle style =
        Provider.of<LoginScreenInboxService>(context, listen: false).style;
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: style.size(3), right: style.size(6)),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              LoginScreenInboxWidgetBack(),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: style.size(3)),
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        Container(
                            margin: EdgeInsets.only(top: style.size(2)),
                            alignment: Alignment.centerLeft,
                            child: LoginScreenInboxWidgetTitle()),
                        Expanded(
                            child: Image.asset('res/images/inbox-pineapple.png',
                                package: 'login')),
                        Container(
                            alignment: Alignment.bottomLeft,
                            child: LoginScreenInboxWidgetSent()),
                        Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(bottom: style.size(15)),
                            child: LoginScreenInboxWidgetResend())
                      ])))
            ])));
  }
}
