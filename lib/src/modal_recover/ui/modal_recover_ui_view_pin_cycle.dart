/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import '../modal_recover_service.dart';
import 'modal_recover_ui_view_pin.dart';

class ModalRecoverUiViewPinCycle extends ModalRecoverUiViewPin {
  final Logger _log = Logger('RecoverUiViewPinCycle');
  static const _error = 'Cannot reuse pin. Try again';

  @override
  String get title => 'Updating security...';

  @override
  String get subtitle => 'Enter a new pin';

  @override
  Future<void> onSubmit(BuildContext context, String pin) async {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    if (pin == service.state.pin)
      service.setError(_error);
    else {
      service.clearError();
      service.setNewPin(pin);
      controller.showCyclePassphrase();
    }
  }

  @override
  void back(BuildContext context) {
    Provider.of<ModalRecoverService>(context, listen: false).clearError();
    controller.showCycle();
  }
}
