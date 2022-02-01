/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_screen_intro_service.dart';
import 'ui/login_screen_intro_layout.dart';

class LoginScreenIntroPresenter extends Page {
  final LoginScreenIntroService service;

  LoginScreenIntroPresenter(this.service)
      : super(key: ValueKey("LoginScreenIntro"));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: service, child: LoginScreenIntroLayout()));
  }
}
