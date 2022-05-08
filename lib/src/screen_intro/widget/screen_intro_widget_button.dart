/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../screen_intro_service.dart';

class ScreenIntroWidgetButton extends StatelessWidget {
  final String text;

  const ScreenIntroWidgetButton(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenIntroService service =
        Provider.of<ScreenIntroService>(context, listen: false);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding:
              EdgeInsets.symmetric(vertical: SizeProvider.instance.height(19)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeProvider.instance.width(37)))),
          primary: ColorProvider.tikiPurple,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Wrap(
              direction: Axis.vertical,
              children: [
                SizedBox(
                    width: SizeProvider.instance.width(228),
                    child: Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorProvider.white,
                          fontWeight: FontWeight.w800,
                          fontSize: SizeProvider.instance.text(22),
                          letterSpacing: SizeProvider.instance.text(0.05),
                          fontFamily: TextProvider.familyNunitoSans,
                          package: TextProvider.package,
                        )))
              ],
            ),
          ],
        ),
        onPressed: () => service.controller.navigateToNextScreen(context));
  }
}
