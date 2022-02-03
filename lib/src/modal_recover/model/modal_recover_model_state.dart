/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'dart:typed_data';

import 'package:wallet/wallet.dart';

import 'modal_recover_model_page.dart';

class ModalRecoverModelState {
  ModalRecoverModelPage page = ModalRecoverModelPage.account;
  ModalRecoverModelPage? previous;

  String? email;
  String? accessToken;

  String? pin;
  String? newPin;
  String? passphrase;

  Uint8List? ciphertext;
  TikiKeysModel? keys;

  String? error;
  String? lockCode;

  bool loading = false;

  ModalRecoverModelState({this.email, this.accessToken});
}
