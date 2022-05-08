/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_inbox_service.dart';

class ScreenInboxWidgetResend extends StatelessWidget {
  static const String _textReceive = "Didn't receive it?";
  static const String _textResend = "Resend now";

  const ScreenInboxWidgetResend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenInboxService service =
        Provider.of<ScreenInboxService>(context, listen: false);
    return Row(children: [
      Text(_textReceive,
          style: TextStyle(
            color: ColorProvider.greySeven,
            height: 1.2,
            fontSize: SizeProvider.instance.text(20),
            fontWeight: FontWeight.w600,
            fontFamily: TextProvider.familyNunitoSans,
            package: 'tiki_style',
          )),
      TextButton(
          onPressed: () => service.controller.resend(context),
          child: Row(children: [
            Container(
                margin: EdgeInsets.only(right: SizeProvider.instance.width(4)),
                child: Text(_textResend,
                    style: TextStyle(
                        fontFamily: TextProvider.familyNunitoSans,
                        package: 'tiki_style',
                        fontSize: SizeProvider.instance.text(20),
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        color: ColorProvider.orange))),
            Icon(IconProvider.reload,
                size: SizeProvider.instance.text(20),
                color: ColorProvider.orange)
          ]))
    ]);
  }
}
