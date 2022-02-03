/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_email_service.dart';
import '../screen_email_style.dart';

class ScreenEmailBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenEmailStyle style = Provider.of<ScreenEmailService>(context).style;
    return Stack(children: [
      Center(child: Container(color: style.backgroundColor)),
      Container(
          margin: EdgeInsets.only(top: style.size(18)),
          alignment: Alignment.topRight,
          child: Image.asset(
            'res/images/email-pineapple.png',
            height: style.size(188),
            package: 'login',
          )),
      Container(
          margin: EdgeInsets.only(top: style.size(271)),
          alignment: Alignment.topLeft,
          child: Image.asset(
            'res/images/email-blob.png',
            height: style.size(107),
            package: 'login',
          ))
    ]);
  }
}
