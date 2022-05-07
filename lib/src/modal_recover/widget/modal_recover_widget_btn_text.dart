/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../modal_recover_service.dart';
import '../modal_recover_style.dart';

class ModalRecoverWidgetBtnText extends StatelessWidget {
  final String _text;
  final void Function() _callback;

  ModalRecoverWidgetBtnText(this._text, this._callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModalRecoverStyle style =
        Provider.of<ModalRecoverService>(context, listen: false).style;
    return TextButton(
        onPressed: _callback,
        style: TextButton.styleFrom(
            fixedSize: Size(style.buttonWidth, style.buttonHeight)),
        child: Text(_text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: style.buttonTextWeight,
              fontSize: style.fontSize,
              fontFamily: TextProvider.familyNunitoSans,
              package: 'tiki_style',
              color: style.buttonColor,
            )));
  }
}
