/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_inbox_service.dart';

class ScreenInboxWidgetBack extends StatelessWidget {
  static const String _text = "Back";

  const ScreenInboxWidgetBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenInboxService service =
        Provider.of<ScreenInboxService>(context, listen: false);
    return TextButton(
      onPressed: () => service.controller.back(context),
      child: Row(children: [
        Container(
          child: Icon(IconProvider.arrow_left,
              size: SizeProvider.instance.text(22),
              color: ColorProvider.orange),
          margin: EdgeInsets.only(right: SizeProvider.instance.width(6)),
        ),
        Text(_text,
            style: TextStyle(
                color: ColorProvider.orange,
                fontFamily: TextProvider.familyNunitoSans,
                package: 'tiki_style',
                fontWeight: FontWeight.w800,
                fontSize: SizeProvider.instance.text(22)))
      ]),
    );
  }
}
