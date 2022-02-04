/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../modal_recover_service.dart';
import 'modal_recover_ui_view_pass.dart';

class ModalRecoverUiViewPassRecover extends ModalRecoverUiViewPass {
  static const _error = 'Incorrect passphrase. Try again';

  @override
  String get title => 'Restoring from backup...';

  @override
  String get subtitle => 'Enter your passphrase';

  @override
  Future<void> onSubmit(BuildContext context, String passphrase) async {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    if(!service.state.loading) {
      if (await service.decrypt(passphrase)) {
        service.state.passphrase = passphrase;
        service.clearError();
        controller.finishLoading();
        controller.showCycle();
      } else {
        controller.finishLoading();
        service.setError(_error);
      }
    }
  }

  @override
  void back(BuildContext context) {
    Provider.of<ModalRecoverService>(context, listen: false).clearError();
    controller.showRecoverPin();
  }
}
