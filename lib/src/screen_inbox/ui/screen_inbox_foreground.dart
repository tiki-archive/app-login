/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../widget/screen_inbox_widget_back.dart';
import '../widget/screen_inbox_widget_resend.dart';
import '../widget/screen_inbox_widget_sent.dart';
import '../widget/screen_inbox_widget_title.dart';

class ScreenInboxForeground extends StatelessWidget {
  const ScreenInboxForeground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.only(
                left: SizeProvider.instance.width(3),
                right: SizeProvider.instance.width(6)),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              ScreenInboxWidgetBack(),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeProvider.instance.width(28)),
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: SizeProvider.instance.height(21)),
                            alignment: Alignment.centerLeft,
                            child: const ScreenInboxWidgetTitle()),
                        Expanded(child: ImgProvider.pineappleAirplane),
                        Container(
                            alignment: Alignment.bottomLeft,
                            child: ScreenInboxWidgetSent()),
                        Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(
                                bottom: SizeProvider.instance.height(113)),
                            child: ScreenInboxWidgetResend())
                      ])))
            ])));
  }
}
