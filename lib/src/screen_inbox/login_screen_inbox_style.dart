/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import '../utils/style.dart';

class LoginScreenInboxStyle extends Style {
  final Color _textColor;
  late final double _textSize;
  final String _textFamily;

  final Color _titleColor;
  late final double _titleSize;
  final String _titleFamily;

  final Color _buttonColor;
  final Color _backgroundColor;

  LoginScreenInboxStyle(
      {MediaQueryData? mediaQueryData,
      String textFamily = 'Arial',
      String titleFamily = 'Arial',
      double titleSize = 28,
      double textSize = 14,
      Color textColor = Colors.black,
      Color titleColor = Colors.black,
      Color buttonColor = Colors.orange,
      Color backgroundColor = Colors.white})
      : _textFamily = textFamily,
        _titleFamily = titleFamily,
        _textColor = textColor,
        _titleColor = titleColor,
        _buttonColor = buttonColor,
        _backgroundColor = backgroundColor,
        super(mediaQueryData: mediaQueryData) {
    _titleSize = text(titleSize);
    _textSize = text(textSize);
  }

  Color get buttonColor => _buttonColor;

  String get titleFamily => _titleFamily;

  double get titleSize => _titleSize;

  Color get titleColor => _titleColor;

  String get textFamily => _textFamily;

  double get textSize => _textSize;

  Color get textColor => _textColor;

  Color get backgroundColor => _backgroundColor;
}
