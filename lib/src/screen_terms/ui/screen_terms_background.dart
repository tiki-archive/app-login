/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ScreenTermsBackground extends StatelessWidget {
  const ScreenTermsBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(child: Container(color: ColorProvider.cream)),
      Align(
        alignment: Alignment.topRight,
        child: Image.asset("res/images/terms-blob-tr.png", package: 'login'),
      )
    ]);
  }
}
