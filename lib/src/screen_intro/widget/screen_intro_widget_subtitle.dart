/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ScreenIntroWidgetSubtitle extends StatelessWidget {
  final String text;

  const ScreenIntroWidgetSubtitle(this.text, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: ColorProvider.tikiPurple,
            fontSize: SizeProvider.instance.text(20),
            fontWeight: FontWeight.bold,
            fontFamily: TextProvider.familyNunitoSans,
            package: TextProvider.package,
            height: 1.2));
  }
}
