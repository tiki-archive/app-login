/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal_recover_service.dart';
import '../model/modal_recover_model_page.dart';
import 'modal_recover_ui_view_account.dart';
import 'modal_recover_ui_view_backup.dart';
import 'modal_recover_ui_view_creating.dart';
import 'modal_recover_ui_view_cycle.dart';
import 'modal_recover_ui_view_error.dart';
import 'modal_recover_ui_view_lock.dart';
import 'modal_recover_ui_view_pass_backup.dart';
import 'modal_recover_ui_view_pass_cycle.dart';
import 'modal_recover_ui_view_pass_recover.dart';
import 'modal_recover_ui_view_pin_backup.dart';
import 'modal_recover_ui_view_pin_cycle.dart';
import 'modal_recover_ui_view_pin_recover.dart';
import 'modal_recover_ui_view_qr_code.dart';
import 'modal_recover_ui_view_recover.dart';
import 'modal_recover_ui_view_success.dart';

class ModalRecoverUiLayout extends StatelessWidget {

  const ModalRecoverUiLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModalRecoverService service = Provider.of<ModalRecoverService>(context);
    switch (service.state.page) {
      case ModalRecoverModelPage.account:
        return ModalRecoverUiViewAccount();
      case ModalRecoverModelPage.creating:
        return const ModalRecoverUiViewCreating();
      case ModalRecoverModelPage.backup:
        return ModalRecoverUiViewBackup();
      case ModalRecoverModelPage.backupPin:
        return ModalRecoverUiViewPinBackup();
      case ModalRecoverModelPage.backupPassphrase:
        return ModalRecoverUiViewPassBackup();
      case ModalRecoverModelPage.success:
        return ModalRecoverUiViewSuccess();
      case ModalRecoverModelPage.recover:
        return ModalRecoverUiViewRecover();
      case ModalRecoverModelPage.qrCode:
        return ModalRecoverUiViewQrCode();
      case ModalRecoverModelPage.recoverPin:
        return ModalRecoverUiViewPinRecover();
      case ModalRecoverModelPage.recoverPassphrase:
        return ModalRecoverUiViewPassRecover();
      case ModalRecoverModelPage.locked:
        return ModalRecoverUiViewLock();
      case ModalRecoverModelPage.error:
        return ModalRecoverUiViewError();
      case ModalRecoverModelPage.cycle:
        return ModalRecoverUiViewCycle();
      case ModalRecoverModelPage.cyclePin:
        return ModalRecoverUiViewPinCycle();
      case ModalRecoverModelPage.cyclePassphrase:
        return ModalRecoverUiViewPassCycle();
    }
  }
}
