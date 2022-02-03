/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_email_service.dart';
import '../screen_email_style.dart';

class ScreenEmailWidgetTos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenEmailService service = Provider.of<ScreenEmailService>(context);
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text("By pressing \"Continue\" you agree to TIKI's ",
            style: _textStyle(service.style, service.style.textColor)),
        _link("Terms of Service", () => service.controller.tos(context),
            service.style),
        Text(" and ",
            style: _textStyle(service.style, service.style.textColor)),
        _link("Privacy Policy", () => service.controller.privacy(context),
            service.style),
      ],
    );
  }

  TextStyle _textStyle(ScreenEmailStyle style, Color color) {
    return TextStyle(
        fontSize: style.text(14),
        fontWeight: FontWeight.bold,
        color: color,
        fontFamily: style.textFamily);
  }

  Widget _link(String text, Function() onPressed, ScreenEmailStyle style) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: 0,
      height: style.text(14),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.all(0),
      child: Text(text, style: _textStyle(style, style.linkColor)),
    );
  }
}
