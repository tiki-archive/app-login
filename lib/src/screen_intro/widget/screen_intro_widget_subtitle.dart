/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_intro_service.dart';
import '../screen_intro_style.dart';

class ScreenIntroWidgetSubtitle extends StatelessWidget {
  final String text;

  ScreenIntroWidgetSubtitle(this.text);

  @override
  Widget build(BuildContext context) {
    ScreenIntroStyle style =
        Provider.of<ScreenIntroService>(context, listen: false).style;
    return Text(text,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: style.textColor,
            fontSize: style.text(20),
            fontWeight: FontWeight.bold,
            fontFamily: TextProvider.familyNunitoSans,
            package: 'tiki_style',
            height: 1.2));
  }
}
