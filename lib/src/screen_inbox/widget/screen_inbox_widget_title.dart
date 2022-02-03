/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_inbox_service.dart';
import '../screen_inbox_style.dart';

class ScreenInboxWidgetTitle extends StatelessWidget {
  static const String _text = "Great, now check your inbox";

  @override
  Widget build(BuildContext context) {
    ScreenInboxStyle style = Provider.of<ScreenInboxService>(context).style;
    return Text(_text,
        style: TextStyle(
            color: style.titleColor,
            fontFamily: style.titleFamily,
            fontSize: style.text(36),
            letterSpacing: style.size(0.02),
            fontWeight: FontWeight.bold));
  }
}
