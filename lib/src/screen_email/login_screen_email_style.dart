/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import '../utils/login_utils_style.dart';

class LoginScreenEmailStyle extends LoginUtilsStyle {
  final String _textFamily;
  final String _titleFamily;

  final Color _titleColor;
  final Color _buttonColor;
  final Color _buttonTextColor;
  final Color _errorColor;
  final Color _backgroundColor;
  final Color _linkColor;
  final Color _hintColor;
  final Color _textColor;

  LoginScreenEmailStyle(
      {MediaQueryData? mediaQueryData,
      String textFamily = 'Arial',
      String titleFamily = 'Arial',
      Color errorColor = Colors.red,
      Color linkColor = Colors.orange,
      Color titleColor = Colors.black,
      Color buttonColor = Colors.purple,
      Color buttonTextColor = Colors.white,
      Color backgroundColor = Colors.white,
      Color hintColor = Colors.grey,
      Color textColor = Colors.grey})
      : _textFamily = textFamily,
        _titleFamily = titleFamily,
        _titleColor = titleColor,
        _errorColor = errorColor,
        _buttonColor = buttonColor,
        _buttonTextColor = buttonTextColor,
        _backgroundColor = backgroundColor,
        _linkColor = linkColor,
        _hintColor = hintColor,
        _textColor = textColor,
        super(mediaQueryData: mediaQueryData);

  LoginScreenEmailStyle.mqd(
      LoginScreenEmailStyle style, MediaQueryData mediaQueryData)
      : _textFamily = style.textFamily,
        _titleFamily = style.titleFamily,
        _titleColor = style.titleColor,
        _errorColor = style.errorColor,
        _buttonColor = style.buttonColor,
        _buttonTextColor = style.buttonTextColor,
        _backgroundColor = style.backgroundColor,
        _linkColor = style.linkColor,
        _hintColor = style.hintColor,
        _textColor = style.textColor,
        super(mediaQueryData: mediaQueryData);

  Color get buttonColor => _buttonColor;

  String get titleFamily => _titleFamily;

  Color get titleColor => _titleColor;

  String get textFamily => _textFamily;

  Color get backgroundColor => _backgroundColor;

  Color get buttonTextColor => _buttonTextColor;

  Color get errorColor => _errorColor;

  Color get linkColor => _linkColor;

  Color get hintColor => _hintColor;

  Color get textColor => _textColor;
}
