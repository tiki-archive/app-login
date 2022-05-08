/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ScreenEmailWidgetSubtitle extends StatelessWidget {
  static const String _text = "Enter your email below to begin.";

  const ScreenEmailWidgetSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(_text,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: SizeProvider.instance.text(20),
            fontWeight: FontWeight.w600,
            fontFamily: TextProvider.familyNunitoSans,
            package: 'tiki_style',
            color: ColorProvider.greySeven));
  }
}
