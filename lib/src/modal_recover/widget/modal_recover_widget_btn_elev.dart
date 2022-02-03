/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal_recover_service.dart';
import '../modal_recover_style.dart';

class ModalRecoverWidgetBtnElev extends StatelessWidget {
  final String _text;
  final void Function() _callback;

  ModalRecoverWidgetBtnElev(this._text, this._callback);

  @override
  Widget build(BuildContext context) {
    ModalRecoverStyle style =
        Provider.of<ModalRecoverService>(context, listen: false).style;
    return ElevatedButton(
      onPressed: _callback,
      child: Text(_text,
          style: TextStyle(
            fontFamily: style.fontFamily,
            fontWeight: style.buttonTextWeight,
            fontSize: style.fontSize,
            color: style.buttonTextColor,
          )),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(style.buttonWidth, style.buttonHeight),
        primary: style.buttonColor,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(style.buttonRadius))),
      ),
    );
  }
}
