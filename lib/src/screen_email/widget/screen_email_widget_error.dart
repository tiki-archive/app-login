/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen_email_service.dart';

class ScreenEmailWidgetError extends StatelessWidget {
  static const String _text = "Please enter a valid email";

  @override
  Widget build(BuildContext context) {
    ScreenEmailService service = Provider.of<ScreenEmailService>(context);
    return Opacity(
      opacity: service.model.isError ? 1.0 : 0.0,
      child: Text(_text,
          style: TextStyle(
              fontSize: service.style.size(15),
              fontWeight: FontWeight.w600,
              fontFamily: service.style.textFamily,
              color: service.style.errorColor)),
    );
  }
}
