/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/widgets.dart';

class LoginUtilsIcons {
  LoginUtilsIcons._();

  static const _kFontFam = 'LoginIcons';
  static const String? _kFontPkg = 'login';

  static const IconData back =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData reload =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
