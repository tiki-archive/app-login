/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_terms_service.dart';

class ScreenTermsWidgetBack extends StatelessWidget {
  static const String _textBack = "Back";

  const ScreenTermsWidgetBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenTermsService service =
        Provider.of<ScreenTermsService>(context, listen: false);
    return TextButton(
      onPressed: () => service.controller.back(context),
      child: Row(children: [
        Container(
          child: Icon(
            IconProvider.arrow_thick_left,
            size: SizeProvider.instance.text(22),
            color: ColorProvider.orange,
          ),
          margin: EdgeInsets.only(right: SizeProvider.instance.width(6)),
        ),
        Text(_textBack,
            style: TextStyle(
                fontFamily: TextProvider.familyNunitoSans,
                package: TextProvider.package,
                color: ColorProvider.orange,
                fontWeight: FontWeight.w800,
                fontSize: SizeProvider.instance.text(22)))
      ]),
    );
  }
}
