/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/utils_icons.dart';
import '../screen_inbox_service.dart';

class ScreenInboxWidgetResend extends StatelessWidget {
  static const String _textReceive = "Didn't receive it?";
  static const String _textResend = "Resend now";

  @override
  Widget build(BuildContext context) {
    ScreenInboxService service =
        Provider.of<ScreenInboxService>(context, listen: false);
    return Row(children: [
      Text(_textReceive,
          style: TextStyle(
              color: service.style.textColor,
              height: 1.2,
              fontSize: service.style.text(20),
              fontWeight: FontWeight.w600,
              fontFamily: service.style.textFamily)),
      TextButton(
          onPressed: () => service.controller.resend(context),
          child: Row(children: [
            Container(
                margin: EdgeInsets.only(right: service.style.size(4)),
                child: Text(_textResend,
                    style: TextStyle(
                        fontFamily: service.style.textFamily,
                        fontSize: service.style.text(20),
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        color: service.style.buttonColor))),
            Icon(UtilsIcons.reload,
                size: service.style.text(20), color: service.style.buttonColor)
          ]))
    ]);
  }
}
