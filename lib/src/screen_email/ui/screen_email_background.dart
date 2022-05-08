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
          child: Image.asset(
            'res/images/email-pineapple.png',
            height: SizeProvider.instance.height(188),
            package: 'login',
          )),
      Container(
          margin: EdgeInsets.only(top: SizeProvider.instance.height(271)),
          alignment: Alignment.topLeft,
          child: Image(
            image: ImgProvider.emailBlob.image,
            height: SizeProvider.instance.height(107),
          ))
    ]);
  }
}
