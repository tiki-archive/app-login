/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_intro_service.dart';
import 'screen_intro_view_1.dart';
import 'screen_intro_view_2.dart';
import 'screen_intro_view_3.dart';

class ScreenIntroLayout extends StatelessWidget {
  const ScreenIntroLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenIntroService service = Provider.of<ScreenIntroService>(context);
    switch (service.model.currentCard) {
      case 0:
        return const ScreenIntroView1();
      case 1:
        return const ScreenIntroView2();
      case 2:
        return const ScreenIntroView3();
      default:
        throw UnimplementedError();
    }
  }
}
