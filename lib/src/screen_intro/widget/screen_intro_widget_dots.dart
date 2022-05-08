/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_intro_service.dart';

class ScreenIntroWidgetDots extends StatelessWidget {
  final int num;
  final int pos;

  const ScreenIntroWidgetDots(this.pos, {this.num = 3, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(num, (i) => _dot(i == pos ? true : false)));
  }

  Widget _dot(bool isActive) {
    double size = SizeProvider.instance.width(8);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size * 0.66),
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: isActive ? ColorProvider.tikiPurple : ColorProvider.white,
          borderRadius: BorderRadius.all(Radius.circular(size * 2))),
    );
  }
}
