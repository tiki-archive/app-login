/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_intro_service.dart';
import '../screen_intro_style.dart';

class ScreenIntroWidgetTitle extends StatelessWidget {
  final String text;

  ScreenIntroWidgetTitle(this.text);

  @override
  Widget build(BuildContext context) {
    ScreenIntroStyle style = Provider.of<ScreenIntroService>(context).style;
    return Text(text,
        textAlign: TextAlign.left,
        style: TextStyle(
            height: 1.1,
            color: style.textColor,
            fontFamily: style.titleFamily,
            fontSize: style.text(44),
            fontWeight: FontWeight.bold));
  }
}
