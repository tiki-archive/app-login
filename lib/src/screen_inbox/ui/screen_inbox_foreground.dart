/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_inbox_service.dart';
import '../screen_inbox_style.dart';
import '../widget/screen_inbox_widget_back.dart';
import '../widget/screen_inbox_widget_resend.dart';
import '../widget/screen_inbox_widget_sent.dart';
import '../widget/screen_inbox_widget_title.dart';

class ScreenInboxForeground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenInboxStyle style =
        Provider.of<ScreenInboxService>(context, listen: false).style;
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: style.size(3), right: style.size(6)),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              ScreenInboxWidgetBack(),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: style.size(28)),
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        Container(
                            margin: EdgeInsets.only(top: style.size(21)),
                            alignment: Alignment.centerLeft,
                            child: ScreenInboxWidgetTitle()),
                        Expanded(
                            child: ImgProvider.pineappleAirplane),
                        Container(
                            alignment: Alignment.bottomLeft,
                            child: ScreenInboxWidgetSent()),
                        Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(bottom: style.size(113)),
                            child: ScreenInboxWidgetResend())
                      ])))
            ])));
  }
}
