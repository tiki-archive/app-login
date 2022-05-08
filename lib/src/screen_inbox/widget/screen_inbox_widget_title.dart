/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ScreenInboxWidgetTitle extends StatelessWidget {
  static const String _text = "Great, now check your inbox";

  const ScreenInboxWidgetTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(_text,
        style: TextStyle(
            color: ColorProvider.tikiPurple,
            fontFamily: TextProvider.familyKoara,
            package: 'tiki_style',
            fontSize: SizeProvider.instance.text(36),
            letterSpacing: SizeProvider.instance.text(0.02),
            fontWeight: FontWeight.bold));
  }
}
