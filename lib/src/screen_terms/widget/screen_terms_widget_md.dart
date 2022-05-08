/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_terms_service.dart';

class ScreenTermsWidgetMd extends StatelessWidget {
  static const double _fontSizeText = 16;

  const ScreenTermsWidgetMd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenTermsService service = Provider.of<ScreenTermsService>(context);
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
                    color: ColorProvider.tikiPurple,
                    fontSize:
                        _relativeHeadingSize(SizeProvider.instance.text, 1),
                    fontWeight: FontWeight.bold,
                    fontFamily: TextProvider.familyKoara),
                h3: TextStyle(
                  fontSize:
                      _relativeHeadingSize(SizeProvider.instance.text, 0.3),
                  color: ColorProvider.tikiPurple,
                  fontWeight: FontWeight.w600,
                  fontFamily: TextProvider.familyNunitoSans,
                  package: 'tiki_style',
                ),
                h4: TextStyle(
                  fontSize:
                      _relativeHeadingSize(SizeProvider.instance.text, 0.1),
                  color: ColorProvider.tikiPurple,
                  fontWeight: FontWeight.w600,
                  fontFamily: TextProvider.familyNunitoSans,
                  package: 'tiki_style',
                ),
                a: TextStyle(
                  color: ColorProvider.orange,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeProvider.instance.text(_fontSizeText),
                  fontFamily: TextProvider.familyNunitoSans,
                  package: 'tiki_style',
                ),
                p: TextStyle(
                  color: ColorProvider.greySeven,
                  fontWeight: FontWeight.normal,
                  fontSize: SizeProvider.instance.text(_fontSizeText),
                  fontFamily: TextProvider.familyNunitoSans,
                  package: 'tiki_style',
                ),
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
