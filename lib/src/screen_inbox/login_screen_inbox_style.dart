/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import '../utils/login_utils_style.dart';

class LoginScreenInboxStyle extends LoginUtilsStyle {
  final Color _textColor;
  final String _textFamily;

  final Color _titleColor;
  final String _titleFamily;

  final Color _buttonColor;
  final Color _backgroundColor;

  LoginScreenInboxStyle(
      {MediaQueryData? mediaQueryData,
      String textFamily = 'Arial',
      String titleFamily = 'Arial',
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
        super(mediaQueryData: mediaQueryData);

  Color get buttonColor => _buttonColor;

  String get titleFamily => _titleFamily;

  Color get titleColor => _titleColor;

  String get textFamily => _textFamily;

  Color get textColor => _textColor;

  Color get backgroundColor => _backgroundColor;
}
