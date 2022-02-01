/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

import '../login_screen_terms_service.dart';

class LoginScreenTermsWidgetMd extends StatelessWidget {
  static const double _fontSizeText = 16;

  @override
  Widget build(BuildContext context) {
    LoginScreenTermsService service =
        Provider.of<LoginScreenTermsService>(context);
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(
            'packages/login/src/screen_terms/' +
                service.model.filename! +
                '.md'),
        builder: (BuildContext context, AsyncSnapshot<String> mdSource) {
          return MarkdownBody(
              selectable: true,
              onTapLink: (String text, String? href, String title) async =>
                  service.controller.openUrl(href),
              styleSheet: MarkdownStyleSheet(
                h1: TextStyle(
                    color: service.style.headingColor,
                    fontSize: _relativeHeadingSize(service.style.text, 1),
                    fontWeight: FontWeight.bold,
                    fontFamily: service.style.titleFamily),
                h3: TextStyle(
                    fontSize: _relativeHeadingSize(service.style.text, 0.3),
                    color: service.style.headingColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: service.style.textFamily),
                h4: TextStyle(
                    fontSize: _relativeHeadingSize(service.style.text, 0.1),
                    color: service.style.headingColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: service.style.textFamily),
                a: TextStyle(
                    color: service.style.linkColor,
                    fontWeight: FontWeight.w600,
                    fontSize: service.style.text(_fontSizeText),
                    fontFamily: service.style.textFamily),
                p: TextStyle(
                    color: service.style.textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: service.style.text(_fontSizeText),
                    fontFamily: service.style.textFamily),
              ),
              data: mdSource.data ?? ""); //mdSource.data
        });
  }

  double _relativeHeadingSize(
      double Function(double raw) responsive, double factor) {
    return ((responsive(36) - responsive(_fontSizeText)) * factor) +
        responsive(_fontSizeText);
  }
}
