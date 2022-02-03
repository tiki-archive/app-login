/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_terms_service.dart';
import '../screen_terms_style.dart';
import '../widget/screen_terms_widget_back.dart';
import '../widget/screen_terms_widget_md.dart';

class ScreenTermsForeground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenTermsStyle style =
        Provider.of<ScreenTermsService>(context, listen: false).style;
    return SafeArea(
        child: Column(children: [
      Container(
          margin: EdgeInsets.only(left: style.size(3)),
          child: ScreenTermsWidgetBack()),
      Expanded(
          child: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.only(
                      top: style.size(2),
                      bottom: style.size(12),
                      left: style.size(6),
                      right: style.size(6)),
                  child: ScreenTermsWidgetMd())))
    ]));
  }
}
