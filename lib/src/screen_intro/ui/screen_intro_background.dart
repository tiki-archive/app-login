/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ScreenIntroBackground extends StatelessWidget {
  final Color background;

  const ScreenIntroBackground(this.background, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(child: Container(color: background)),
      Align(
        alignment: Alignment.bottomLeft,
        child: ImgProvider.introBlob,
      ),
      Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(bottom: SizeProvider.instance.height(36)),
          child: ImgProvider.introPineapple)
    ]);
  }
}
