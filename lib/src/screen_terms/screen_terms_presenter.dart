/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen_terms_service.dart';
import 'ui/screen_terms_layout.dart';

class ScreenTermsPresenter {
  final ScreenTermsService service;

  ScreenTermsPresenter(this.service);

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: service, child: ScreenTermsLayout()));
  }
}
