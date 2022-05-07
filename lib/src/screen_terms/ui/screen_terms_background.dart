/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_terms_service.dart';
import '../screen_terms_style.dart';

class ScreenTermsBackground extends StatelessWidget {
  const ScreenTermsBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenTermsStyle style =
        Provider.of<ScreenTermsService>(context, listen: false).style;
    return Stack(children: [
      Center(child: Container(color: style.backgroundColor)),
      Align(
        alignment: Alignment.topRight,
        child: ImgProvider.termsBlobTr
      )
    ]);
  }
}
