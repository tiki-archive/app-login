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

  @override
  String get title => 'Backing up...';

  @override
  String get subtitle => 'Enter a passphrase';

  @override
  Future<void> onSubmit(BuildContext context, String passphrase) async {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    if (passphrase.length < 8) {
      controller.finishLoading();
      service.setError(_error);
    } else {
      await service.backup(passphrase, () {
        service.clearError();
        controller.finishLoading();
        controller.showSuccess();
      }, (error) {
        controller.finishLoading();
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

  @override
  void back(BuildContext context) {
    Provider.of<ModalRecoverService>(context, listen: false).clearError();
    controller.showBackupPin();
  }
}