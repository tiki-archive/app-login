/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_intro_service.dart';
import '../screen_intro_style.dart';

class ScreenIntroWidgetDots extends StatelessWidget {
  final int num;
  final int pos;

  late final ScreenIntroStyle style;

  ScreenIntroWidgetDots(this.pos, {Key? key, this.num = 3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    style = Provider.of<ScreenIntroService>(context, listen: false).style;
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(num, (i) => _dot(i == pos ? true : false)));
  }

  Widget _dot(bool isActive) {
    double size = style.size(8);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size * 0.66),
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: isActive ? style.dotColorActive : style.dotColor,
          borderRadius: BorderRadius.all(Radius.circular(size * 2))),
    );
  }
}
