/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

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
          child: SizedBox(child: ImgProvider.pineappleAirplane, height: style.size(188)),
      ),
      Container(
          margin: EdgeInsets.only(top: style.size(271)),
          alignment: Alignment.topLeft,
          child: SizedBox(child: ImgProvider.emailBlob, height: style.size(107))
          )
    ]);
  }
}
