/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:tiki_style/tiki_style.dart';

class ModalRecoverWidgetText extends StatelessWidget {
  final String _text;
  final Color? _color;
  final FontStyle? _fontStyle;

  const ModalRecoverWidgetText(this._text,
      {Key? key, Color? color, FontStyle? fontStyle})
      : _color = color,
        _fontStyle = fontStyle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(_text,
        textAlign: TextAlign.center,
        style: TextStyle(
            height: 1.2,
            fontWeight: FontWeight.w600,
            fontSize: SizeProvider.instance.text(18),
            fontFamily: TextProvider.familyNunitoSans,
            package: 'tiki_style',
            color: _color ?? ColorProvider.tikiPurple,
            fontStyle: _fontStyle ?? FontStyle.normal));
  }
}
