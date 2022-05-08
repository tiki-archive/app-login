/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_intro_service.dart';

class ScreenIntroWidgetSkipButton extends StatelessWidget {
  static const String _text = 'Skip';

  const ScreenIntroWidgetSkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenIntroService service =
        Provider.of<ScreenIntroService>(context, listen: false);
    return TextButton(
        onPressed: () => service.controller.skipToLogin(context),
        child: Text(
          _text,
          style: TextStyle(
              color: ColorProvider.tikiBlue,
              fontWeight: FontWeight.bold,
              fontSize: SizeProvider.instance.text(20),
              fontFamily: TextProvider.familyNunitoSans,
              package: TextProvider.package,
              height: 1.2),
        ));
  }
}
