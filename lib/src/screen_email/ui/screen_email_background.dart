/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ScreenEmailBackground extends StatelessWidget {
  const ScreenEmailBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(child: Container(color: ColorProvider.cream)),
      Container(
          margin: EdgeInsets.only(top: SizeProvider.instance.height(18)),
          alignment: Alignment.topRight,
          child: Image(
              image: ImgProvider.pineappleLeanIn.image,
              height: SizeProvider.instance.height(188))),
      Container(
          margin: EdgeInsets.only(top: SizeProvider.instance.height(272)),
          alignment: Alignment.topLeft,
          child: Image(
            image: ImgProvider.emailBlob.image,
            height: SizeProvider.instance.height(107),
          ))
    ]);
  }
}
