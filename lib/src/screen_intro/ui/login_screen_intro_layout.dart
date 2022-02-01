/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_intro_service.dart';
import 'login_screen_intro_view_1.dart';
import 'login_screen_intro_view_2.dart';
import 'login_screen_intro_view_3.dart';

class LoginScreenIntroLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginScreenIntroService service =
        Provider.of<LoginScreenIntroService>(context);
    switch (service.model.currentCard) {
      case 0:
        return LoginScreenIntroView1();
      case 1:
        return LoginScreenIntroView2();
      case 2:
        return LoginScreenIntroView3();
      default:
        throw UnimplementedError();
    }
  }
}
