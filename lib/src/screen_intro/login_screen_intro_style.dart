/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import '../utils/login_utils_style.dart';

class LoginScreenIntroStyle extends LoginUtilsStyle {
  final Color _backgroundColor1;
  final Color _backgroundColor2;
  final Color _backgroundColor3;
  final Color _textColor;
  final Color _buttonColor;
  final Color _buttonTextColor;
  final Color _skipColor;
  final Color _dotColor;
  final Color _dotColorActive;

  final String _textFamily;
  final String _titleFamily;

  LoginScreenIntroStyle(
      {MediaQueryData? mediaQueryData,
      Color backgroundColor1 = Colors.yellow,
      Color backgroundColor2 = Colors.yellow,
      Color backgroundColor3 = Colors.yellow,
      Color buttonColor = Colors.purple,
      Color buttonTextColor = Colors.white,
      Color skipColor = Colors.black,
      Color dotColor = Colors.white,
      Color dotColorActive = Colors.purple,
      Color textColor = Colors.purple,
      String textFamily = 'Arial',
      String titleFamily = 'Arial'})
      : _backgroundColor1 = backgroundColor1,
        _backgroundColor2 = backgroundColor2,
        _backgroundColor3 = backgroundColor3,
        _buttonColor = buttonColor,
        _buttonTextColor = buttonTextColor,
        _skipColor = skipColor,
        _dotColor = dotColor,
        _dotColorActive = dotColorActive,
        _textColor = textColor,
        _textFamily = textFamily,
        _titleFamily = titleFamily,
        super(mediaQueryData: mediaQueryData);

  LoginScreenIntroStyle.mqd(
      LoginScreenIntroStyle style, MediaQueryData mediaQueryData)
      : _backgroundColor1 = style.backgroundColor1,
        _backgroundColor2 = style.backgroundColor2,
        _backgroundColor3 = style.backgroundColor3,
        _buttonColor = style.buttonColor,
        _buttonTextColor = style.buttonTextColor,
        _skipColor = style.skipColor,
        _dotColor = style.dotColor,
        _dotColorActive = style.dotColorActive,
        _textColor = style.textColor,
        _textFamily = style.textFamily,
        _titleFamily = style.titleFamily,
        super(mediaQueryData: mediaQueryData);

  Color get backgroundColor3 => _backgroundColor3;

  Color get backgroundColor2 => _backgroundColor2;

  Color get backgroundColor1 => _backgroundColor1;

  Color get skipColor => _skipColor;

  Color get buttonColor => _buttonColor;

  Color get dotColorActive => _dotColorActive;

  Color get dotColor => _dotColor;

  Color get textColor => _textColor;

  Color get buttonTextColor => _buttonTextColor;

  String get titleFamily => _titleFamily;

  String get textFamily => _textFamily;
}
