/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../widget/screen_terms_widget_back.dart';
import '../widget/screen_terms_widget_md.dart';

class ScreenTermsForeground extends StatelessWidget {
  const ScreenTermsForeground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Container(
          margin: EdgeInsets.only(left: SizeProvider.instance.width(3)),
          child: const ScreenTermsWidgetBack()),
      Expanded(
          child: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.only(
                      top: SizeProvider.instance.height(2),
                      bottom: SizeProvider.instance.height(12),
                      left: SizeProvider.instance.width(6),
                      right: SizeProvider.instance.width(6)),
                  child: const ScreenTermsWidgetMd())))
    ]));
  }
}
