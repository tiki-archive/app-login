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

class ModalRecoverUiViewPassBackup extends ModalRecoverUiViewPass {
  final Logger _log = Logger('RecoverUiViewPassBackup');
  static const _error = 'Invalid. Must be 8+ characters';

  ModalRecoverUiViewPassBackup({Key? key}) : super(key: key);

  @override
  String get title => 'Backing up...';

  @override
  String get subtitle => 'Enter a passphrase';

  @override
  Future<void> onSubmit(BuildContext context, String passphrase) async {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    if (!service.state.loading) {
      if (passphrase.length < 8) {
        service.setLoading(false);
        service.setError(_error);
      } else {
        service.setLoading(true);
        await service.backup(passphrase, () {
          service.clearError();
          service.setLoading(false);

          // Logged in with passphrase and changed it

          // logged in with qr code
          service.amplitude?.logEvent("RETURNING_USER", eventProperties: {
            "method": "PIN_PASSPHRASE"
          });

          controller.showSuccess();
        }, (error) {
          service.setLoading(true);
          if (error is StateError) {
            service.setError(error.message);
            controller.showError();
          } else {
            _log.severe(error);
            service.setError('Weird error. Try again.');
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
    controller.showBackupPin();
  }
}
