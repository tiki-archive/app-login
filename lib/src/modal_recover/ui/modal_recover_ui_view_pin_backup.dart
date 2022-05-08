/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../modal_recover_service.dart';
import 'modal_recover_ui_view_pin.dart';

class ModalRecoverUiViewPinBackup extends ModalRecoverUiViewPin {
  ModalRecoverUiViewPinBackup({Key? key}) : super(key: key);

  @override
  String get title => 'Backing up...';

  @override
  String get subtitle => 'Enter a pin';

  @override
  void onSubmit(BuildContext context, String pin) {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    if (!service.state.loading) {
      service.setPin(pin);
      controller.showBackupPassphrase();
    }
  }

  @override
  void back(BuildContext context) {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    service.clearError();
    service.setLoading(false);
    controller.showBackup();
  }
}
