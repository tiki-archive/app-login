/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_email_service.dart';

class ScreenEmailWidgetButton extends StatelessWidget {
  static const String _text = "CONTINUE";

  const ScreenEmailWidgetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenEmailService service = Provider.of<ScreenEmailService>(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: SizeProvider.instance.height(19),
                horizontal: SizeProvider.instance.width(52.5)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeProvider.instance.width(37)))),
            primary: ColorProvider.tikiPurple),
        child: Text(_text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorProvider.white,
              fontFamily: TextProvider.familyNunitoSans,
              package: 'tiki_style',
              fontWeight: FontWeight.w800,
              fontSize: SizeProvider.instance.text(22),
              letterSpacing: SizeProvider.instance.text(0.05),
            )),
        onPressed: service.model.canSubmit
            ? () => service.controller.submit(context)
            : null);
  }
}
