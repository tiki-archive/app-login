/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../modal_recover_service.dart';
import '../widget/modal_recover_widget_btn_elev.dart';
import '../widget/modal_recover_widget_btn_text.dart';
import '../widget/modal_recover_widget_text.dart';
import 'modal_recover_ui_view.dart';

class ModalRecoverUiViewAccount extends ModalRecoverUiView {
  static const String _title = 'We can’t find an account on this device for ';
  static const String _opt1Txt = 'Create new account';
  static const String _opt2Txt = 'Use an existing account';

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
                        padding:
                            EdgeInsets.symmetric(vertical: style.size(10))),
                    ModalRecoverWidgetBtnText(_opt2Txt, controller.showRecover)
                  ]))
            ]));
  }

  @override
  void back(BuildContext context) => Navigator.pop(context);
}
