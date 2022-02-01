/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_intro_service.dart';
import '../login_screen_intro_style.dart';

class LoginScreenIntroWidgetDots extends StatelessWidget {
  final int num;
  final int pos;

  late final LoginScreenIntroStyle style;

  LoginScreenIntroWidgetDots(this.pos, {this.num = 3});

  @override
  Widget build(BuildContext context) {
    style = Provider.of<LoginScreenIntroService>(context, listen: false).style;
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(num, (i) => _dot(i == pos ? true : false)));
  }

  Widget _dot(bool isActive) {
    double size = style.size(0.9);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size * 0.5),
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: isActive ? style.dotColorActive : style.dotColor,
          borderRadius: BorderRadius.all(Radius.circular(size * 2))),
    );
  }
}
