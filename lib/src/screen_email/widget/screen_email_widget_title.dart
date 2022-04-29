/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_email_service.dart';
import '../screen_email_style.dart';

class ScreenEmailWidgetTitle extends StatelessWidget {
  static const String _text = "Hey, nice to see you here";

  const ScreenEmailWidgetTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenEmailStyle style = Provider.of<ScreenEmailService>(context).style;
    return Text(_text,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: TextProvider.familyKoara,
            package: 'tiki_style',
            color: style.titleColor,
            fontSize: style.text(36),
            letterSpacing: style.size(0.02),
            fontWeight: FontWeight.bold));
  }
}
