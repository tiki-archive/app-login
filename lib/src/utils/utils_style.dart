/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:tiki_style/tiki_style.dart';

abstract class UtilsStyle {
  double size(double raw) => SizeProvider.instance.size(raw);

  double text(double raw) => SizeProvider.instance.text(raw);
}
