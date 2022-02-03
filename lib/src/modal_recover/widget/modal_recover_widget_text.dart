/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../modal_recover_service.dart';
import '../modal_recover_style.dart';

class ModalRecoverWidgetText extends StatelessWidget {
  final String _text;
  final Color? _color;
  final FontStyle? _fontStyle;

  const ModalRecoverWidgetText(this._text, {Color? color, FontStyle? fontStyle})
      : _color = color,
        _fontStyle = fontStyle;

  @override
  Widget build(BuildContext context) {
    ModalRecoverStyle style =
        Provider.of<ModalRecoverService>(context, listen: false).style;
    return Text(_text,
        textAlign: TextAlign.center,
        style: TextStyle(
            height: 1.2,
            fontWeight: style.textWeight,
            fontSize: style.fontSize,
            fontFamily: style.fontFamily,
            color: _color ?? style.textColor,
            fontStyle: _fontStyle ?? FontStyle.normal));
  }
}
