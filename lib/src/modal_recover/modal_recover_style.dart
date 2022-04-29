/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../utils/utils_style.dart';

class ModalRecoverStyle extends UtilsStyle{

  final Color _textColor = ColorProvider.tikiPurple;
  final Color _backgroundColor = ColorProvider.white;
  final Color _buttonColor = ColorProvider.orange;
  final Color _errorColor = ColorProvider.tikiRed;
  final Color _buttonTextColor = ColorProvider.white;
  final Color _hintColor = ColorProvider.greySix;
  final Color _modalNavColor = Colors.grey;

  final double _modalHeight = 349;
  final double _modalNavIconSize = 16;
  final double _modalContentPadding = 20;
  final double _textPaddingHorizontal = 20;
  final double _fontSize = 18;
  final double _buttonWidth = 324;
  final double _buttonHeight = 58;
  final double _buttonRadius = 12;

  final FontWeight _textWeight = FontWeight.w600;
  final FontWeight _buttonTextWeight = FontWeight.w700;


  late final double _modalContainerHeight;

  Color get backgroundColor => _backgroundColor;

  Color get modalNavColor => _modalNavColor;

  double get modalContainerHeight => _modalContainerHeight;

  double get modalNavIconSize => SizeProvider.instance.size(_modalNavIconSize);

  double get fontSize => _fontSize;

  Color get textColor => _textColor;

  FontWeight get textWeight => _textWeight;

  double get buttonWidth => _buttonWidth;

  double get buttonHeight => _buttonHeight;

  double get buttonRadius => _buttonRadius;

  Color get buttonColor => _buttonColor;

  Color get buttonTextColor => _buttonTextColor;

  FontWeight get buttonTextWeight => _buttonTextWeight;

  Color get hintColor => _hintColor;

  Color get errorColor => _errorColor;

  double get modalContentPadding => _modalContentPadding;

  double get textPaddingHorizontal => _textPaddingHorizontal;


}
