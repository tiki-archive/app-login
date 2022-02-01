/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_intro_service.dart';
import '../widget/login_screen_intro_widget_button.dart';
import '../widget/login_screen_intro_widget_dots.dart';
import '../widget/login_screen_intro_widget_skip_button.dart';
import '../widget/login_screen_intro_widget_subtitle.dart';
import '../widget/login_screen_intro_widget_title.dart';

class LoginScreenIntroForeground extends StatelessWidget {
  final String title;
  final String subtitle;
  final String button;
  final int pos;

  LoginScreenIntroForeground(this.pos, this.title, this.subtitle, this.button);

  @override
  Widget build(BuildContext context) {
    LoginScreenIntroService service =
        Provider.of<LoginScreenIntroService>(context, listen: false);
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: service.style.size(25)),
            child: Column(children: [
              Container(
                  margin: EdgeInsets.only(top: service.style.size(19)),
                  alignment: Alignment.topRight,
                  child: LoginScreenIntroWidgetSkipButton()),
              Container(
                  margin: EdgeInsets.only(
                      top: service.style.size(60),
                      right: service.style.size(25)),
                  alignment: Alignment.centerLeft,
                  child: LoginScreenIntroWidgetTitle(title)),
              Container(
                  margin: EdgeInsets.only(
                      top: service.style.size(20),
                      right: service.style.size(25)),
                  child: LoginScreenIntroWidgetSubtitle(subtitle)),
              Container(
                  margin: EdgeInsets.only(
                      top: service.style.size(20),
                      right: service.style.size(25)),
                  alignment: Alignment.centerLeft,
                  child: LoginScreenIntroWidgetDots(pos)),
              Container(
                  margin: EdgeInsets.only(top: service.style.size(50)),
                  alignment: Alignment.centerLeft,
                  child: LoginScreenIntroWidgetButton(button)),
            ])));
  }
}
