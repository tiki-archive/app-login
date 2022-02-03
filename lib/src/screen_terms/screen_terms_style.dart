/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import '../utils/utils_style.dart';

class ScreenTermsStyle extends UtilsStyle {
  final Color _backgroundColor;
  final Color _linkColor;
  final Color _textColor;
  final Color _headingColor;
  final String _textFamily;
  final String _titleFamily;

  ScreenTermsStyle(
      {MediaQueryData? mediaQueryData,
      Color backgroundColor = Colors.white,
      Color textColor = Colors.black,
      Color headingColor = Colors.black,
      Color linkColor = Colors.orange,
      String textFamily = 'Arial',
      String titleFamily = 'Arial'})
      : _backgroundColor = backgroundColor,
        _linkColor = linkColor,
        _textColor = textColor,
        _textFamily = textFamily,
        _titleFamily = titleFamily,
        _headingColor = headingColor,
        super(mediaQueryData: mediaQueryData);

  ScreenTermsStyle.mqd(ScreenTermsStyle style, MediaQueryData mediaQueryData)
      : _backgroundColor = style.backgroundColor,
        _linkColor = style.linkColor,
        _textColor = style.textColor,
        _textFamily = style.textFamily,
        _titleFamily = style.titleFamily,
        _headingColor = style.headingColor,
        super(mediaQueryData: mediaQueryData);

  Color get backgroundColor => _backgroundColor;

  String get textFamily => _textFamily;

  Color get textColor => _textColor;

  Color get linkColor => _linkColor;

  Color get headingColor => _headingColor;

  String get titleFamily => _titleFamily;
}
