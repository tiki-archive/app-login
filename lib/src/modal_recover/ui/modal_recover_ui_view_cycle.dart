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

class ModalRecoverUiViewCycle extends ModalRecoverUiView {
  static const String _title = 'Awesome! You restored your account.';
  static const String _hint =
      'Just one last step. We need to update your account security';
  static const String _opt1Txt = 'Continue';

  late final ModalRecoverService service;

  ModalRecoverUiViewCycle({Key? key}) : super(key: key);

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
                child: const ModalRecoverWidgetText(_title)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      padding: EdgeInsets.only(
                          bottom: SizeProvider.instance.height(40),
                          left: SizeProvider.instance.width(20),
                          right: SizeProvider.instance.width(20)),
                      child: const ModalRecoverWidgetText(_hint,
                          color: ColorProvider.greySeven,
                          fontStyle: FontStyle.italic)),
                  ModalRecoverWidgetBtnElev(_opt1Txt, controller.showCyclePin)
                ]))
          ],
        ));
  }

  @override
  void back(BuildContext context) => controller.showRecoverPassphrase();
}
