/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../widget/screen_email_widget_button.dart';
import '../widget/screen_email_widget_error.dart';
import '../widget/screen_email_widget_input.dart';
import '../widget/screen_email_widget_subtitle.dart';
import '../widget/screen_email_widget_title.dart';
import '../widget/screen_email_widget_tos.dart';

class ScreenEmailForeground extends StatelessWidget {
  const ScreenEmailForeground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeProvider.instance.width(32)),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  margin: EdgeInsets.only(
                      top: SizeProvider.instance.height(51),
                      right: SizeProvider.instance.width(60)),
                  alignment: Alignment.centerLeft,
                  child: const ScreenEmailWidgetTitle()),
              Container(
                  margin:
                      EdgeInsets.only(top: SizeProvider.instance.height(15)),
                  alignment: Alignment.centerLeft,
                  child: const ScreenEmailWidgetSubtitle()),
              Container(
                  margin:
                      EdgeInsets.only(top: SizeProvider.instance.height(15)),
                  child: const ScreenEmailWidgetInput()),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: SizeProvider.instance.height(5)),
                  child: const ScreenEmailWidgetError()),
              Container(
                  margin: EdgeInsets.only(top: SizeProvider.instance.height(5)),
                  child: const ScreenEmailWidgetButton()),
              Container(
                  margin:
                      EdgeInsets.only(top: SizeProvider.instance.height(20)),
                  child: const ScreenEmailWidgetTos()),
            ])));
  }
}
