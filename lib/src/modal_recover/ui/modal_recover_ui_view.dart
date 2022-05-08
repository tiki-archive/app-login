/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../modal_recover_controller.dart';
import '../modal_recover_service.dart';

abstract class ModalRecoverUiView extends StatelessWidget {
  late final ModalRecoverController controller;

  ModalRecoverUiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    controller = service.controller;
    return Container(
        padding: EdgeInsets.only(top: SizeProvider.instance.height(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () => back(context),
                    child: Icon(IconProvider.arrow_left,
                        size: SizeProvider.instance.text(16),
                        color: ColorProvider.greyThree)),
                TextButton(
                    onPressed: () => controller.close(context),
                    child: Icon(IconProvider.x,
                        size: SizeProvider.instance.text(16),
                        color: ColorProvider.greyThree))
              ],
            ),
            page(context)
          ],
        ));
  }

  Widget page(BuildContext context);

  void back(BuildContext context);
}
