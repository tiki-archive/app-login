/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_email_service.dart';
import '../screen_email_style.dart';
import '../widget/screen_email_widget_button.dart';
import '../widget/screen_email_widget_error.dart';
import '../widget/screen_email_widget_input.dart';
import '../widget/screen_email_widget_subtitle.dart';
import '../widget/screen_email_widget_title.dart';
import '../widget/screen_email_widget_tos.dart';

class ScreenEmailForeground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenEmailStyle style = Provider.of<ScreenEmailService>(context).style;
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: style.size(32)),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  margin: EdgeInsets.only(
                      top: style.size(51), right: style.size(60)),
                  alignment: Alignment.centerLeft,
                  child: ScreenEmailWidgetTitle()),
              Container(
                  margin: EdgeInsets.only(top: style.size(15)),
                  alignment: Alignment.centerLeft,
                  child: ScreenEmailWidgetSubtitle()),
              Container(
                  margin: EdgeInsets.only(top: style.size(15)),
                  child: ScreenEmailWidgetInput()),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: style.size(5)),
                  child: ScreenEmailWidgetError()),
              Container(
                  margin: EdgeInsets.only(top: style.size(5)),
                  child: ScreenEmailWidgetButton()),
              Container(
                  margin: EdgeInsets.only(top: style.size(20)),
                  child: ScreenEmailWidgetTos()),
            ])));
  }
}
