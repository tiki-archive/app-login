/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../modal_recover_service.dart';
import '../widget/modal_recover_widget_pin.dart';
import '../widget/modal_recover_widget_text.dart';
import 'modal_recover_ui_view.dart';

abstract class ModalRecoverUiViewPin extends ModalRecoverUiView {
  ModalRecoverUiViewPin({Key? key}) : super(key: key);

  @override
  Widget page(BuildContext context) {
    ModalRecoverService service = Provider.of<ModalRecoverService>(context);
    return Container(
        height: MediaQuery.of(context).viewInsets.bottom + style.size(200),
        padding: EdgeInsets.all(style.modalContentPadding),
        child: Stack(children: [
          Padding(
              padding: EdgeInsets.all(style.modalContentPadding),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ModalRecoverWidgetText(title),
                    Container(
                        padding: EdgeInsets.only(bottom: style.size(50)),
                        child: service.state.error == null
                            ? ModalRecoverWidgetText(subtitle)
                            : ModalRecoverWidgetText(service.state.error!,
                                color: style.errorColor)),
                    ModalRecoverWidgetPin((pin) => onSubmit(context, pin)),
                  ])),
          if (service.state.loading)
            Container(
                color: const Color.fromRGBO(255, 255, 255, 0.5),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(height: style.size(100), child: AnimationProvider.recoverLoading)))
        ]));
  }

  String get title;
  String get subtitle;

  void onSubmit(BuildContext context, String pin);
}
