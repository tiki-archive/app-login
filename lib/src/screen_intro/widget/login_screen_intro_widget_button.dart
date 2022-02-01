/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen_intro_service.dart';

class LoginScreenIntroWidgetButton extends StatelessWidget {
  final String text;

  LoginScreenIntroWidgetButton(this.text);

  @override
  Widget build(BuildContext context) {
    LoginScreenIntroService service =
        Provider.of<LoginScreenIntroService>(context, listen: false);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: service.style.size(2)),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(service.style.size(10)))),
          primary: service.style.buttonColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Wrap(
              direction: Axis.vertical,
              children: [
                Container(
                    width: service.style.size(70),
                    child: Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: service.style.text(16),
                          letterSpacing: service.style.size(0.05),
                          fontFamily: service.style.fontFamily,
                        )))
              ],
            ),
          ],
        ),
        onPressed: () => service.controller.navigateToNextScreen(context));
  }
}
