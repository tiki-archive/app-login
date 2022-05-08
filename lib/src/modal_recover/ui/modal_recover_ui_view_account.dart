/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../modal_recover_service.dart';
import '../widget/modal_recover_widget_btn_elev.dart';
import '../widget/modal_recover_widget_btn_text.dart';
import '../widget/modal_recover_widget_text.dart';
import 'modal_recover_ui_view.dart';

class ModalRecoverUiViewAccount extends ModalRecoverUiView {
  static const String _title = 'We can’t find an account on this device for ';
  static const String _opt1Txt = 'Create new account';
  static const String _opt2Txt = 'Use an existing account';

  ModalRecoverUiViewAccount({Key? key}) : super(key: key);

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
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeProvider.instance.width(20)),
                  child: ModalRecoverWidgetText(_title +
                      (Provider.of<ModalRecoverService>(context).state.email ??
                          ''))),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    ModalRecoverWidgetBtnElev(
                        _opt1Txt, controller.showCreating),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeProvider.instance.height(10))),
                    ModalRecoverWidgetBtnText(_opt2Txt, controller.showRecover)
                  ]))
            ]));
  }

  @override
  void back(BuildContext context) => Navigator.pop(context);
}
