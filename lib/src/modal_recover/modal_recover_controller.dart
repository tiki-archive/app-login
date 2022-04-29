/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/widgets.dart';
import '../flow/model/flow_model_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../flow/flow_service.dart';
import 'modal_recover_service.dart';
import 'model/modal_recover_model_page.dart';

class ModalRecoverController {
  final ModalRecoverService _service;

  ModalRecoverController(this._service);

  void showPrevious() => _service.showPage(_service.state.previous!);
  void showAccount() => _service.showPage(ModalRecoverModelPage.account);
  void showCreating() => _service.showPage(ModalRecoverModelPage.creating);
  void showBackup() => _service.showPage(ModalRecoverModelPage.backup);
  void showQrCode() => _service.showPage(ModalRecoverModelPage.qrCode);
  void showSuccess() => _service.showPage(ModalRecoverModelPage.success);
  void showRecover() => _service.showPage(ModalRecoverModelPage.recover);
  void showBackupPin() => _service.showPage(ModalRecoverModelPage.backupPin);
  void showBackupPassphrase() =>
      _service.showPage(ModalRecoverModelPage.backupPassphrase);
  void showRecoverPin() => _service.showPage(ModalRecoverModelPage.recoverPin);
  void showRecoverPassphrase() =>
      _service.showPage(ModalRecoverModelPage.recoverPassphrase);
  void showError() => _service.showPage(ModalRecoverModelPage.error);
  void showLocked() => _service.showPage(ModalRecoverModelPage.locked);
  void showCycle() => _service.showPage(ModalRecoverModelPage.cycle);
  void showCyclePin() => _service.showPage(ModalRecoverModelPage.cyclePin);
  void showCyclePassphrase() =>
      _service.showPage(ModalRecoverModelPage.cyclePassphrase);

  Future<bool> scanQr() async {
    if (await Permission.camera.request().isGranted) {
      ScanResult result = await BarcodeScanner.scan();
      if (result.type == ResultType.Barcode) {
        List keys = result.rawContent.split(".");
        return _service.decode(keys[0], keys[1], keys[2]);
      }
    }
    return false;
  }

  void close(BuildContext context) {
    FlowService service = Provider.of<FlowService>(context, listen: false);
    service.changeState(FlowModelState.otpVerified);
    return Navigator.of(context).pop();
  }

  Future<void> complete(BuildContext context) async {
    FlowService flowService = Provider.of<FlowService>(context, listen: false);
    ModalRecoverService recoverService =
        Provider.of<ModalRecoverService>(context, listen: false);
    await flowService.login(address: recoverService.state.keys?.address);
    return Navigator.of(context).pop();
  }

  Future<bool> contactSupport(String? code) => launchUrl(Uri(
          scheme: 'mailto',
          path: 'support@mytiki.com',
          query:
              'subject=${Uri.encodeComponent('Account Locked')}&body=${Uri.encodeComponent('My TIKI account is locked. Code: $code')}')
      );
}
