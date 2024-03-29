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

  ModalRecoverUiViewPassRecover({Key? key}) : super(key: key);

  @override
  String get title => 'Restoring from backup...';

  @override
  String get subtitle => 'Enter your passphrase';

  @override
  Future<void> onSubmit(BuildContext context, String passphrase) async {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    if (!service.state.loading) {
      service.setLoading(true);
      if (await service.decrypt(passphrase)) {
        service.state.passphrase = passphrase;
        service.clearError();
        service.setLoading(false);
        controller.showCycle();
      } else {
        service.setLoading(false);
        service.setError(_error);
      }
    }
  }

  @override
  void back(BuildContext context) {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    service.clearError();
    service.setLoading(false);
    controller.showRecoverPin();
  }
}
