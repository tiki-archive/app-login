/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ScreenIntroWidgetTitle extends StatelessWidget {
  final String text;

  const ScreenIntroWidgetTitle(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.left,
        style: TextStyle(
            height: 1.1,
            color: ColorProvider.tikiPurple,
            fontFamily: TextProvider.familyKoara,
            fontSize: SizeProvider.instance.text(44),
            fontWeight: FontWeight.bold));
  }
}
