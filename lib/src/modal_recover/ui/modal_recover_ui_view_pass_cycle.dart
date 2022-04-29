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
    if (!service.state.loading) {
      if (passphrase == service.state.passphrase) {
        service.setError(_error);
      } else {
        service.clearError();
        service.setLoading(true);
        await service.cycle(passphrase, controller.showSuccess, (error) {
          if (error is StateError) {
            service.setError(error.message);
            service.setLoading(false);
            controller.showError();
          } else {
            _log.severe(error);
            service.setError('Weird error. Try again.');
            service.setLoading(false);
            controller.showError();
          }
        });
      }
    }
  }

  @override
  void back(BuildContext context) {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    service.clearError();
    service.setLoading(false);
    controller.showCyclePin();
  }
}
