/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../widget/screen_intro_widget_button.dart';
import '../widget/screen_intro_widget_dots.dart';
import '../widget/screen_intro_widget_skip_button.dart';
import '../widget/screen_intro_widget_subtitle.dart';
import '../widget/screen_intro_widget_title.dart';

class ScreenIntroForeground extends StatelessWidget {
  final String title;
  final String subtitle;
  final String button;
  final int pos;

  const ScreenIntroForeground(this.pos, this.title, this.subtitle, this.button,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeProvider.instance.width(25)),
            child: Column(children: [
              Container(
                  margin:
                      EdgeInsets.only(top: SizeProvider.instance.height(19)),
                  alignment: Alignment.topRight,
                  child: const ScreenIntroWidgetSkipButton()),
              Container(
                  margin: EdgeInsets.only(
                      top: SizeProvider.instance.height(60),
                      right: SizeProvider.instance.width(25)),
                  alignment: Alignment.centerLeft,
                  child: ScreenIntroWidgetTitle(title)),
              Container(
                  margin: EdgeInsets.only(
                      top: SizeProvider.instance.height(20),
                      right: SizeProvider.instance.width(25)),
                  child: ScreenIntroWidgetSubtitle(subtitle)),
              Container(
                  margin: EdgeInsets.only(
                      top: SizeProvider.instance.height(20),
                      right: SizeProvider.instance.width(25)),
                  alignment: Alignment.centerLeft,
                  child: ScreenIntroWidgetDots(pos)),
              Container(
                  margin:
                      EdgeInsets.only(top: SizeProvider.instance.height(50)),
                  alignment: Alignment.centerLeft,
                  child: ScreenIntroWidgetButton(button)),
            ])));
  }
}
