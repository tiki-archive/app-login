/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../../utils/utils_icons.dart';
import '../screen_inbox_service.dart';

class ScreenInboxWidgetBack extends StatelessWidget {
  static const String _text = "Back";

  ScreenInboxWidgetBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenInboxService service =
        Provider.of<ScreenInboxService>(context, listen: false);
    return TextButton(
      onPressed: () => service.controller.back(context),
      child: Row(children: [
        Container(
          child: Icon(UtilsIcons.arrow,
              size: service.style.text(22), color: service.style.buttonColor),
          margin: EdgeInsets.only(right: service.style.size(6)),
        ),
        Text(_text,
            style: TextStyle(
                color: service.style.buttonColor,
                fontFamily: TextProvider.familyNunitoSans,
                package: 'tiki_style',
                fontWeight: FontWeight.w800,
                fontSize: service.style.text(22)))
      ]),
    );
  }
}
