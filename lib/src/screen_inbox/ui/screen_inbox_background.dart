/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_inbox_service.dart';
import '../screen_inbox_style.dart';

class ScreenInboxBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenInboxStyle style =
        Provider.of<ScreenInboxService>(context, listen: false).style;
    return Stack(children: [
      Center(child: Container(color: style.backgroundColor)),
      Align(
          alignment: Alignment.topRight,
          child: Image.asset('res/images/inbox-blob-tr.png',
              height: style.size(140), package: 'login')),
      Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset('res/images/inbox-blob-bl.png',
              height: style.size(140), package: 'login')),
    ]);
  }
}
