/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ScreenInboxBackground extends StatelessWidget {
  const ScreenInboxBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(child: Container(color: ColorProvider.cream)),
      Align(
          alignment: Alignment.topRight,
          child: Image(
              image: ImgProvider.inboxBlobTr.image,
              height: SizeProvider.instance.height(140))),
      Align(
          alignment: Alignment.bottomLeft,
          child: Image(
              image: ImgProvider.inboxBlobBl.image,
              height: SizeProvider.instance.height(140))),
    ]);
  }
}
