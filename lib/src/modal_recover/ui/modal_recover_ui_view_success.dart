/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login/src/modal_recover/widget/modal_recover_widget_btn_elev.dart';
import 'package:login/src/modal_recover/widget/modal_recover_widget_text.dart';

import 'modal_recover_ui_view.dart';

class ModalRecoverUiViewSuccess extends ModalRecoverUiView {
  static const String _title = "Nice job. You're in.";
  static const String _opt1Txt = 'Close';

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
                padding: EdgeInsets.only(bottom: style.size(10)),
                child: ModalRecoverWidgetText(_title)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      padding: EdgeInsets.only(bottom: style.size(30)),
                      child: Image.asset(
                          "res/images/recover-pineapple-pizza.png",
                          width: 75,
                          package: 'login')),
                  ModalRecoverWidgetBtnElev(
                      _opt1Txt, () => controller.complete(context))
                ])),
          ],
        ));
  }

  @override
  void back(BuildContext context) => controller.showPrevious();
}
