/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:login/src/screen_intro/login_screen_intro_style.dart';
import 'package:provider/provider.dart';

import '../login_screen_intro_service.dart';
import 'login_screen_intro_background.dart';
import 'login_screen_intro_foreground.dart';

abstract class LoginScreenIntroView extends StatelessWidget {
  late final LoginScreenIntroStyle style;

  @override
  Widget build(BuildContext context) {
    LoginScreenIntroService service =
        Provider.of<LoginScreenIntroService>(context, listen: false);
    style = service.style;
    return Scaffold(
        body: Center(
            child: GestureDetector(
                child: Stack(children: [
                  LoginScreenIntroBackground(background),
                  LoginScreenIntroForeground(pos, title, subtitle, button)
                ]),
                onHorizontalDragEnd: (dragEndDetails) => service.controller
                    .onHorizontalDrag(context, dragEndDetails))));
  }

  Color get background;
  String get title;
  String get subtitle;
  String get button;
  int get pos;
}
