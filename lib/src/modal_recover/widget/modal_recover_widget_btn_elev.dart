/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ModalRecoverWidgetBtnElev extends StatelessWidget {
  final String _text;
  final void Function() _callback;

  const ModalRecoverWidgetBtnElev(this._text, this._callback, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _callback,
      child: Text(_text,
          style: TextStyle(
            fontFamily: TextProvider.familyNunitoSans,
            package: 'tiki_style',
            fontWeight: FontWeight.w700,
            fontSize: SizeProvider.instance.text(18),
            color: ColorProvider.white,
          )),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
            SizeProvider.instance.width(324), SizeProvider.instance.height(58)),
        primary: ColorProvider.orange,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(SizeProvider.instance.width(12)))),
      ),
    );
  }
}
