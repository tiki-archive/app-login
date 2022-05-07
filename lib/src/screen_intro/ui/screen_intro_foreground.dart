/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_intro_service.dart';
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

  const ScreenIntroForeground(this.pos, this.title, this.subtitle, this.button);

  @override
  Widget build(BuildContext context) {
    ScreenIntroService service =
        Provider.of<ScreenIntroService>(context, listen: false);
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: service.style.size(25)),
            child: Column(children: [
              Container(
                  margin: EdgeInsets.only(top: service.style.size(19)),
                  alignment: Alignment.topRight,
                  child: ScreenIntroWidgetSkipButton()),
              Container(
                  margin: EdgeInsets.only(
                      top: service.style.size(60),
                      right: service.style.size(25)),
                  alignment: Alignment.centerLeft,
                  child: ScreenIntroWidgetTitle(title)),
              Container(
                  margin: EdgeInsets.only(
                      top: service.style.size(20),
                      right: service.style.size(25)),
                  child: ScreenIntroWidgetSubtitle(subtitle)),
              Container(
                  margin: EdgeInsets.only(
                      top: service.style.size(20),
                      right: service.style.size(25)),
                  alignment: Alignment.centerLeft,
                  child: ScreenIntroWidgetDots(pos)),
              Container(
                  margin: EdgeInsets.only(top: service.style.size(50)),
                  alignment: Alignment.centerLeft,
                  child: ScreenIntroWidgetButton(button)),
            ])));
  }
}
