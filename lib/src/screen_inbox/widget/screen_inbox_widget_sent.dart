/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_inbox_service.dart';

class ScreenInboxWidgetSent extends StatelessWidget {
  static const String _text = "I sent an email with a link to";

  const ScreenInboxWidgetSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenInboxService service = Provider.of<ScreenInboxService>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(_text,
          style: TextStyle(
              color: service.style.textColor,
              fontFamily: TextProvider.familyNunitoSans,
              package: 'tiki_style',
              fontSize: service.style.text(20),
              height: 1.2,
              fontWeight: FontWeight.w600)),
      Text(service.model.email ?? "",
          style: TextStyle(
              color: service.style.textColor,
              fontFamily: TextProvider.familyNunitoSans,
              package: 'tiki_style',
              fontSize: service.style.text(20),
              height: 1.2,
              fontWeight: FontWeight.bold))
    ]);
  }
}
