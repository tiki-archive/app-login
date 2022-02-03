/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_intro_service.dart';

class ScreenIntroBackground extends StatelessWidget {
  final Color background;

  ScreenIntroBackground(this.background);

  @override
  Widget build(BuildContext context) {
    ScreenIntroService service =
        Provider.of<ScreenIntroService>(context, listen: false);
    return Stack(children: [
      Center(child: Container(color: background)),
      Align(
        alignment: Alignment.bottomLeft,
        child: Image.asset('res/images/intro-blob.png', package: 'login'),
      ),
      Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(bottom: service.style.size(36)),
          child:
              Image.asset('res/images/intro-pineapple.png', package: 'login'))
    ]);
  }
}
