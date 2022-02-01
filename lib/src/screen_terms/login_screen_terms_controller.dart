/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login_screen_terms_service.dart';

class LoginScreenTermsController {
  final LoginScreenTermsService service;

  LoginScreenTermsController(this.service);

  back(BuildContext context) {
    Navigator.of(context).pop();
  }

  openUrl(String? href) async {
    if (href != null && await canLaunch(href)) await launch(href);
  }
}