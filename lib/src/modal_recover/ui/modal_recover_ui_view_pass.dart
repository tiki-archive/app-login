/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../modal_recover_service.dart';
import '../widget/modal_recover_widget_pass.dart';
import '../widget/modal_recover_widget_text.dart';
import 'modal_recover_ui_view.dart';

abstract class ModalRecoverUiViewPass extends ModalRecoverUiView {
  ModalRecoverUiViewPass({Key? key}) : super(key: key);

  @override
  Widget page(BuildContext context) {
    ModalRecoverService service = Provider.of<ModalRecoverService>(context);
    return Container(
        height: MediaQuery.of(context).viewInsets.bottom +
            SizeProvider.instance.height(200),
        padding: EdgeInsets.all(SizeProvider.instance.width(20)),
        child: Stack(children: [
          Padding(
              padding: EdgeInsets.all(SizeProvider.instance.width(20)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ModalRecoverWidgetText(title),
                    Container(
                        padding: EdgeInsets.only(
                            bottom: SizeProvider.instance.height(30)),
                        child: service.state.error == null
                            ? ModalRecoverWidgetText(subtitle)
                            : ModalRecoverWidgetText(service.state.error!,
                                color: ColorProvider.tikiRed)),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeProvider.instance.width(40)),
                      child: ModalRecoverWidgetPass((passphrase) {
                        onSubmit(context, passphrase);
                      }),
                    )
                  ])),
          if (service.state.loading)
            Container(
                color: const Color.fromRGBO(255, 255, 255, 0.5),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(child: AnimationProvider.recoverLoading)))
        ]));
  }

  String get title;
  String get subtitle;

  void onSubmit(BuildContext context, String passphrase);
}
