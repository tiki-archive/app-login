/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/login_flow_model_otp.dart';
import 'login_flow_repository_ss.dart';

class LoginFlowRepositoryOtp extends LoginFlowRepositorySS<LoginFlowModelOtp> {
  static const String _table = "otp";
  static const String _version = "0.0.1";

  LoginFlowRepositoryOtp({FlutterSecureStorage? secureStorage})
      : super(
            table: _table,
            version: _version,
            toJson: (LoginFlowModelOtp model) => model.toJson(),
            fromJson: (Map<String, dynamic>? json) =>
                LoginFlowModelOtp.fromJson(json),
            secureStorage: secureStorage);
}
