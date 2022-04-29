/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widget/modal_recover_widget_btn_elev.dart';
import '../widget/modal_recover_widget_btn_text.dart';
import '../widget/modal_recover_widget_text.dart';

import 'modal_recover_ui_view.dart';

class ModalRecoverUiViewRecover extends ModalRecoverUiView {
  static const String _title =
      'Are you logged into another device in your possession?';
  static const String _opt1Txt = 'Yes';
  static const String _opt2Txt = 'No';

  ModalRecoverUiViewRecover({Key? key}) : super(key: key);

  @override
  Widget page(BuildContext context) {
    return Container(
        height: style.modalContainerHeight,
        padding: EdgeInsets.all(style.modalContentPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: style.textPaddingHorizontal),
                child: ModalRecoverWidgetText(_title)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  ModalRecoverWidgetBtnElev(_opt1Txt, controller.showQrCode),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: style.size(10))),
                  ModalRecoverWidgetBtnText(_opt2Txt, controller.showRecoverPin)
                ])),
          ],
        ));
  }

  @override
  void back(BuildContext context) => controller.showAccount();
}
