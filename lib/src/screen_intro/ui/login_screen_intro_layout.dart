/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_intro_service.dart';
import 'login_screen_intro_view.dart';
import 'login_screen_intro_view_1.dart';
import 'login_screen_intro_view_2.dart';
import 'login_screen_intro_view_3.dart';

class LoginScreenIntroLayout extends StatelessWidget {
  final List<LoginScreenIntroView> cards = [
    LoginScreenIntroView1(),
    LoginScreenIntroView2(),
    LoginScreenIntroView3(),
  ];

  @override
  Widget build(BuildContext context) {
    LoginScreenIntroService service =
        Provider.of<LoginScreenIntroService>(context);
    return cards[service.model.currentCard];
  }
}
