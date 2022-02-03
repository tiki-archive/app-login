/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_email_service.dart';

class ScreenEmailWidgetButton extends StatelessWidget {
  static const String _text = "CONTINUE";

  @override
  Widget build(BuildContext context) {
    ScreenEmailService service = Provider.of<ScreenEmailService>(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: service.style.size(19),
                horizontal: service.style.size(52.5)),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(service.style.size(37)))),
            primary: service.style.buttonColor),
        child: Text(_text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: service.style.buttonTextColor,
              fontFamily: service.style.textFamily,
              fontWeight: FontWeight.w800,
              fontSize: service.style.size(22),
              letterSpacing: service.style.size(0.05),
            )),
        onPressed: service.model.canSubmit
            ? () => service.controller.submit(context)
            : null);
  }
}