/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_screen_terms_service.dart';
import 'ui/login_screen_terms_layout.dart';

class LoginScreenTermsPresenter {
  final LoginScreenTermsService service;

  LoginScreenTermsPresenter(this.service);

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: service, child: LoginScreenTermsLayout()));
  }
}
