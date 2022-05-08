/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_email_service.dart';

class ScreenEmailWidgetInput extends StatelessWidget {
  static const String _placeholder = "Your email";

  const ScreenEmailWidgetInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenEmailService service = Provider.of<ScreenEmailService>(context);
    return TextField(
        style: TextStyle(
          color: ColorProvider.tikiPurple,
          fontWeight: FontWeight.bold,
          fontSize: SizeProvider.instance.text(20),
          fontFamily: TextProvider.familyNunitoSans,
          package: 'tiki_style',
        ),
        cursorColor: ColorProvider.orange,
        autocorrect: false,
        autofocus: true,
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeProvider.instance.width(16),
                vertical: SizeProvider.instance.height(20)),
            hintText: _placeholder,
            hintStyle: TextStyle(
                color: ColorProvider.greyFive,
                fontWeight: FontWeight.bold,
                fontFamily: TextProvider.familyNunitoSans,
                package: 'tiki_style',
                fontSize: SizeProvider.instance.text(20)),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: service.model.isError
                        ? ColorProvider.tikiRed
                        : ColorProvider.tikiPurple,
                    width: SizeProvider.instance.width(1),
                    style: BorderStyle.solid)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: service.model.isError
                        ? ColorProvider.tikiRed
                        : ColorProvider.tikiPurple,
                    width: SizeProvider.instance.width(1),
                    style: BorderStyle.solid))),
        onChanged: service.controller.onChanged);
  }
}
