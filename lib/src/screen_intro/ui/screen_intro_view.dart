/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_intro_service.dart';
import '../screen_intro_style.dart';
import 'screen_intro_background.dart';
import 'screen_intro_foreground.dart';

abstract class ScreenIntroView extends StatelessWidget {
  late final ScreenIntroStyle style;

  @override
  Widget build(BuildContext context) {
    ScreenIntroService service =
        Provider.of<ScreenIntroService>(context, listen: false);
    style = service.style;
    return Scaffold(
        body: Center(
            child: GestureDetector(
                child: Stack(children: [
                  ScreenIntroBackground(background),
                  ScreenIntroForeground(pos, title, subtitle, button)
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
