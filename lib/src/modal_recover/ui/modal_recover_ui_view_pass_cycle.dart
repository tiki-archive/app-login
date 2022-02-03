/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import '../modal_recover_service.dart';
import 'modal_recover_ui_view_pass.dart';

class ModalRecoverUiViewPassCycle extends ModalRecoverUiViewPass {
  final Logger _log = Logger('RecoverUiViewPassCycle');
  static const _error = 'Cannot reuse passphrase. Try again';

  @override
  String get title => 'Updating security...';

  @override
  String get subtitle => 'Enter a new passphrase';

  @override
  Future<void> onSubmit(BuildContext context, String passphrase) async {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    if (passphrase == service.state.passphrase)
      service.setError(_error);
    else {
      service.clearError();
      await service.cycle(passphrase, controller.showSuccess, (error) {
        if (error is StateError) {
          service.setError(error.message);
          controller.finishLoading();
          controller.showError();
        } else {
          _log.severe(error);
          service.setError('Weird error. Try again.');
          controller.finishLoading();
          controller.showError();
        }
      });
    }
  }

  @override
  void back(BuildContext context) {
    Provider.of<ModalRecoverService>(context, listen: false).clearError();
    controller.showCyclePin();
  }
}