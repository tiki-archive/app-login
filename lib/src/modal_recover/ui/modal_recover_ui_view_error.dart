/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../modal_recover_service.dart';
import '../widget/modal_recover_widget_btn_elev.dart';
import '../widget/modal_recover_widget_text.dart';
import 'modal_recover_ui_view.dart';

class ModalRecoverUiViewError extends ModalRecoverUiView {
  static const String _opt1Txt = 'Try again';
  static const String _defaultMessage = 'Weird error. Try again';

  late final ModalRecoverService service;

  @override
  Widget page(BuildContext context) {
    service = Provider.of<ModalRecoverService>(context);
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
                child: ModalRecoverWidgetText(
                    service.state.error ?? _defaultMessage,
                    color: style.errorColor)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      padding: EdgeInsets.only(bottom: style.size(30)),
                      child: Image.asset("res/images/recover-avocado.png",
                          width: 75, package: 'login')),
                  ModalRecoverWidgetBtnElev(_opt1Txt, () {
                    service.clearError();
                    controller.showPrevious();
                  })
                ])),
          ],
        ));
  }

  @override
  void back(BuildContext context) {
    service.clearError();
    controller.showPrevious();
  }
}
