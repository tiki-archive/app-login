/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ModalRecoverWidgetBtnText extends StatelessWidget {
  final String _text;
  final void Function() _callback;

  const ModalRecoverWidgetBtnText(this._text, this._callback, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: _callback,
        style: TextButton.styleFrom(
            fixedSize: Size(SizeProvider.instance.width(324),
                SizeProvider.instance.height(58))),
        child: Text(_text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SizeProvider.instance.text(18),
              fontFamily: TextProvider.familyNunitoSans,
              package: 'tiki_style',
              color: ColorProvider.orange,
            )));
  }
}
