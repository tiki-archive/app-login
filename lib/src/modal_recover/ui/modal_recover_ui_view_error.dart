/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../modal_recover_service.dart';
import '../widget/modal_recover_widget_btn_elev.dart';
import '../widget/modal_recover_widget_text.dart';
import 'modal_recover_ui_view.dart';

class ModalRecoverUiViewError extends ModalRecoverUiView {
  static const String _opt1Txt = 'Try again';
  static const String _defaultMessage = 'Weird error. Try again';

  late final ModalRecoverService service;

  ModalRecoverUiViewError({Key? key}) : super(key: key);

  @override
  Widget page(BuildContext context) {
    service = Provider.of<ModalRecoverService>(context);
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
                child: ModalRecoverWidgetText(
                    service.state.error ?? _defaultMessage,
                    color: ColorProvider.tikiRed)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      padding: EdgeInsets.only(
                          bottom: SizeProvider.instance.height(30)),
                      child: ImgProvider.avocadoSad),
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
