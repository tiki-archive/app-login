/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';
import 'package:tiki_wallet/tiki_wallet.dart';

import 'modal_recover_controller.dart';
import 'modal_recover_presenter.dart';
import 'model/modal_recover_model_page.dart';
import 'model/modal_recover_model_state.dart';

class ModalRecoverService extends ChangeNotifier {
  final Logger _log = Logger('ModalRecoverService');
  final ModalRecoverModelState state;
  final TikiKeysService _keysService;
  final TikiBkupService _bkupService;
  late final ModalRecoverPresenter presenter;
  late final ModalRecoverController controller;

  ModalRecoverService(this.state,
      {FlutterSecureStorage? secureStorage,
      Httpp? httpp,
      Future<void> Function(Function(String?)?)? refresh})
      : _keysService = TikiKeysService(secureStorage: secureStorage),
        _bkupService = TikiBkupService(
            httpp: httpp,
            refresh: refresh,
            accessToken: () => state.accessToken) {
    presenter = ModalRecoverPresenter(this);
    controller = ModalRecoverController(this);
  }

  void showPage(ModalRecoverModelPage page) {
    state.previous = state.page;
    state.page = page;
    notifyListeners();
  }

  void setError(String? error) {
    state.error = error;
    notifyListeners();
  }

  void clearError() {
    state.error = null;
    notifyListeners();
  }

  void setLockCode(String? code) {
    state.lockCode = code;
    notifyListeners();
  }

  void setPin(String pin) {
    state.pin = pin;
    notifyListeners();
  }

  void setNewPin(String newPin) {
    state.newPin = newPin;
    notifyListeners();
  }

  void setPassphrase(String passphrase) {
    state.passphrase = passphrase;
    notifyListeners();
  }

  Future<bool> decode(String address, String data, String sign) async {
    if (address.length != 44 || data.length != 44 || sign.length != 1624) {
      return false;
    } else {
      try {
        state.keys = TikiKeysModel.decode(address, sign, data);
        await _keysService.provide(state.keys!);
        notifyListeners();
        return true;
      } catch (error) {
        _log.warning(error);
        return false;
      }
    }
  }

  Future<bool> decrypt(String passphrase) async {
    state.keys = await _keysService.decrypt(passphrase, state.ciphertext!);
    if (state.keys == null) {
      return false;
    } else {
      await _keysService.provide(state.keys!);
      return true;
    }
  }

  Future<void> lookup(
          String pin, Function(bool) onComplete, Function(Error) onError) =>
      _bkupService.recover(
          email: state.email!,
          pin: pin,
          onError: (error) => onError(_mapError(error)),
          onSuccess: (ciphertext) {
            if (ciphertext != null) {
              state.ciphertext = ciphertext;
              notifyListeners();
              onComplete(true);
            } else {
              onComplete(false);
            }
          });

  Future<void> cycle(
      String passphrase, Function() onSuccess, Function(Error) onError) async {
    Uint8List ciphertext = await _keysService.encrypt(passphrase, state.keys!);
    return _bkupService.cycle(
        email: state.email!,
        oldPin: state.pin!,
        newPin: state.newPin!,
        ciphertext: ciphertext,
        onError: (error) => onError(_mapError(error)),
        onSuccess: onSuccess);
  }

  Future<void> backup(
      String passphrase, Function() onSuccess, Function(Error) onError) async {
    Uint8List ciphertext = await _keysService.encrypt(passphrase, state.keys!);
    return _bkupService.backup(
        email: state.email!,
        pin: state.pin!,
        ciphertext: ciphertext,
        onError: (error) => onError(_mapError(error)),
        onSuccess: onSuccess);
  }

  Future<void> generate() async {
    state.keys = await _keysService.generate();
    notifyListeners();
  }

  Error _mapError(error) {
    if (error is TikiBkupErrorLock) {
      return error;
    } else if (error is SocketException) {
      return StateError('No internet. Try again');
    } else {
      return StateError('Weird error. Try again');
    }
  }

  void setLoading(bool isLoading) {
    state.loading = isLoading;
    notifyListeners();
  }
}
