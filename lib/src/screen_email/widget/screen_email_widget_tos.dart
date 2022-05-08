/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_email_service.dart';

class ScreenEmailWidgetTos extends StatelessWidget {
  const ScreenEmailWidgetTos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenEmailService service = Provider.of<ScreenEmailService>(context);
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text("By pressing \"Continue\" you agree to TIKI's ",
            style: _textStyle(ColorProvider.greySeven)),
        _link("Terms of Service", () => service.controller.tos(context)),
        Text(" and ", style: _textStyle(ColorProvider.greySeven)),
        _link("Privacy Policy", () => service.controller.privacy(context)),
      ],
    );
  }

  TextStyle _textStyle(Color color) {
    return TextStyle(
      fontSize: SizeProvider.instance.text(14),
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: TextProvider.familyNunitoSans,
      package: 'tiki_style',
    );
  }

  Widget _link(String text, Function() onPressed) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: 0,
      height: SizeProvider.instance.text(14),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.all(0),
      child: Text(text, style: _textStyle(ColorProvider.orange)),
    );
  }
}
