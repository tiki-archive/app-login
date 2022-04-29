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

  ScreenEmailWidgetInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenEmailService service = Provider.of<ScreenEmailService>(context);
    return TextField(
        style: TextStyle(
          color: service.style.buttonColor,
          fontWeight: FontWeight.bold,
          fontSize: service.style.text(20),
          fontFamily: TextProvider.familyNunitoSans,
          package: 'tiki_style',
        ),
        cursorColor: service.style.linkColor,
        autocorrect: false,
        autofocus: true,
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: service.style.size(16),
                vertical: service.style.size(20)),
            hintText: _placeholder,
            hintStyle: TextStyle(
                color: service.style.hintColor,
                fontWeight: FontWeight.bold,
                fontFamily: TextProvider.familyNunitoSans,
                package: 'tiki_style',
                fontSize: service.style.text(20)),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: service.model.isError
                        ? service.style.errorColor
                        : service.style.buttonColor,
                    width: service.style.size(1),
                    style: BorderStyle.solid)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: service.model.isError
                        ? service.style.errorColor
                        : service.style.buttonColor,
                    width: service.style.size(1),
                    style: BorderStyle.solid))),
        onChanged: service.controller.onChanged);
  }
}
