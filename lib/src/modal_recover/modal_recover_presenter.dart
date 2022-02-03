/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modal_recover_service.dart';
import 'modal_recover_style.dart';
import 'ui/modal_recover_ui_layout.dart';

class ModalRecoverPresenter {
  final ModalRecoverService _service;
  final ModalRecoverStyle _style;

  ModalRecoverPresenter(this._service, this._style);

  Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: _style.backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(_style.size(36)))),
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: _service, child: ModalRecoverUiLayout()));
  }
}
