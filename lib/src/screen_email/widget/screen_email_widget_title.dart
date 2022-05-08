/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ScreenEmailWidgetTitle extends StatelessWidget {
  static const String _text = "Hey, nice to see you here";

  const ScreenEmailWidgetTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(_text,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: TextProvider.familyKoara,
            package: 'tiki_style',
            color: ColorProvider.tikiPurple,
            fontSize: SizeProvider.instance.text(36),
            letterSpacing: SizeProvider.instance.text(0.02),
            fontWeight: FontWeight.bold));
  }
}
