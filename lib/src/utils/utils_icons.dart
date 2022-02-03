/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/widgets.dart';

class UtilsIcons {
  UtilsIcons._();

  static const _kFontFam = 'LoginIcons';
  static const String? _kFontPkg = 'login';

  static const IconData arrow =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData x =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData reload =
      IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
