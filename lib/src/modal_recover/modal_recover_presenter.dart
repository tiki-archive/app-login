/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import 'modal_recover_service.dart';
import 'ui/modal_recover_ui_layout.dart';

class ModalRecoverPresenter {
  final ModalRecoverService _service;

  ModalRecoverPresenter(this._service);

  Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: ColorProvider.cream,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(SizeProvider.instance.width(36)))),
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: _service, child: const ModalRecoverUiLayout()));
  }
}
