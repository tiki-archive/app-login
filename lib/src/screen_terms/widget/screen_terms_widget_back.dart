/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/utils_icons.dart';
import '../screen_terms_service.dart';

class ScreenTermsWidgetBack extends StatelessWidget {
  static const String _textBack = "Back";

  @override
  Widget build(BuildContext context) {
    ScreenTermsService service =
        Provider.of<ScreenTermsService>(context, listen: false);
    return TextButton(
      onPressed: () => service.controller.back(context),
      child: Row(children: [
        Container(
          child: Icon(
            UtilsIcons.arrow,
            size: service.style.text(22),
            color: service.style.linkColor,
          ),
          margin: EdgeInsets.only(right: service.style.size(6)),
        ),
        Text(_textBack,
            style: TextStyle(
                fontFamily: service.style.textFamily,
                color: service.style.linkColor,
                fontWeight: FontWeight.w800,
                fontSize: service.style.text(22)))
      ]),
    );
  }
}
