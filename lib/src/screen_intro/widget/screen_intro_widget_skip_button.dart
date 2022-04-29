/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_intro_service.dart';

class ScreenIntroWidgetSkipButton extends StatelessWidget {
  static const String _text = 'Skip';

  @override
  Widget build(BuildContext context) {
    ScreenIntroService service =
        Provider.of<ScreenIntroService>(context, listen: false);
    return Container(
        child: TextButton(
            onPressed: () => service.controller.skipToLogin(context),
            child: Text(
              _text,
              style: TextStyle(
                  color: service.style.skipColor,
                  fontWeight: FontWeight.bold,
                  fontSize: service.style.text(20),
                  fontFamily: TextProvider.familyNunitoSans,
                  package: 'tiki_style',
                  height: 1.2),
            )));
  }
}
