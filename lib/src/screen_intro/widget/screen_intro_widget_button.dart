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

  ScreenIntroWidgetButton(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenIntroService service =
        Provider.of<ScreenIntroService>(context, listen: false);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: service.style.size(16)),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(service.style.size(37)))),
          primary: service.style.buttonColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Wrap(
              direction: Axis.vertical,
              children: [
                SizedBox(
                    width: service.style.size(228),
                    child: Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: service.style.buttonTextColor,
                          fontWeight: FontWeight.w800,
                          fontSize: service.style.text(22),
                          letterSpacing: service.style.size(0.05),
                          fontFamily: TextProvider.familyNunitoSans,
                          package: 'tiki_style',
                        )))
              ],
            ),
          ],
        ),
        onPressed: () => service.controller.navigateToNextScreen(context));
  }
}
