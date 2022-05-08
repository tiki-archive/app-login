/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiki_style/tiki_style.dart';

import '../widget/modal_recover_widget_btn_elev.dart';
import '../widget/modal_recover_widget_text.dart';
import 'modal_recover_ui_view.dart';

class ModalRecoverUiViewSuccess extends ModalRecoverUiView {
  static const String _title = "Nice job. You're in.";
  static const String _opt1Txt = 'Close';

  ModalRecoverUiViewSuccess({Key? key}) : super(key: key);

  @override
  Widget page(BuildContext context) {
    return Container(
        height: SizeProvider.instance.height(309),
        padding: EdgeInsets.all(SizeProvider.instance.width(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding:
                    EdgeInsets.only(bottom: SizeProvider.instance.height(10)),
                child: const ModalRecoverWidgetText(_title)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      padding: EdgeInsets.only(
                          bottom: SizeProvider.instance.height(30)),
                      child: ImgProvider.pineapplePizza),
                  ModalRecoverWidgetBtnElev(
                      _opt1Txt, () => controller.complete(context))
                ])),
          ],
        ));
  }

  @override
  void back(BuildContext context) => controller.showPrevious();
}
