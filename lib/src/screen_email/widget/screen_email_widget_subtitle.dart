/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_email_service.dart';
import '../screen_email_style.dart';

class ScreenEmailWidgetSubtitle extends StatelessWidget {
  static const String _text = "Enter your email below to begin.";

  @override
  Widget build(BuildContext context) {
    ScreenEmailStyle style = Provider.of<ScreenEmailService>(context).style;
    return Text(_text,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: style.text(20),
            fontWeight: FontWeight.w600,
            fontFamily: TextProvider.familyNunitoSans,
            package: 'tiki_style',
            color: style.textColor));
  }
}
