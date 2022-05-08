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

class ModalRecoverUiViewLock extends ModalRecoverUiView {
  static const String _opt1Txt = 'Contact support';
  static const String _title =
      'Too many attempts. Your account has been locked.';
  static const String _code = 'Give support this code:';

  late final ModalRecoverService service;

  ModalRecoverUiViewLock({Key? key}) : super(key: key);

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
                padding: EdgeInsets.symmetric(
                    horizontal: SizeProvider.instance.width(20)),
                child: const ModalRecoverWidgetText(_title,
                    color: ColorProvider.tikiRed)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const ModalRecoverWidgetText(_code,
                      color: ColorProvider.greySeven,
                      fontStyle: FontStyle.italic),
                  Container(
                      padding: EdgeInsets.only(
                          left: SizeProvider.instance.width(10),
                          right: SizeProvider.instance.width(10),
                          bottom: SizeProvider.instance.height(40)),
                      child: ModalRecoverWidgetText(
                          service.state.lockCode ?? '',
                          color: ColorProvider.greySeven,
                          fontStyle: FontStyle.italic)),
                  ModalRecoverWidgetBtnElev(_opt1Txt,
                      () => controller.contactSupport(service.state.lockCode))
                ]))
          ],
        ));
  }

  @override
  void back(BuildContext context) {
    service.clearError();
    controller.showPrevious();
  }
}
