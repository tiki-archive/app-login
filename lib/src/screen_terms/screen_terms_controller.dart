/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'screen_terms_service.dart';

class ScreenTermsController {
  final ScreenTermsService service;

  ScreenTermsController(this.service);

  void back(BuildContext context) => Navigator.of(context).pop();

  Future<bool> openUrl(String? href) async {
    if (href != null && await canLaunch(href))
      return launch(href);
    else
      return false;
  }
}
