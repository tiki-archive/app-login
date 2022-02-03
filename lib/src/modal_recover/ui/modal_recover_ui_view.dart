/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/utils_icons.dart';
import '../modal_recover_controller.dart';
import '../modal_recover_service.dart';
import '../modal_recover_style.dart';

abstract class ModalRecoverUiView extends StatelessWidget {
  late final ModalRecoverStyle style;
  late final ModalRecoverController controller;

  @override
  Widget build(BuildContext context) {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    style = service.style;
    controller = service.controller;
    return Container(
        padding: EdgeInsets.only(top: style.size(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () => back(context),
                    child: Icon(UtilsIcons.arrow,
                        size: style.modalNavIconSize,
                        color: style.modalNavColor)),
                TextButton(
                    onPressed: () => controller.close(context),
                    child: Icon(UtilsIcons.x,
                        size: style.modalNavIconSize,
                        color: style.modalNavColor))
              ],
            ),
            page(context)
          ],
        ));
  }

  Widget page(BuildContext context);

  void back(BuildContext context);
}
