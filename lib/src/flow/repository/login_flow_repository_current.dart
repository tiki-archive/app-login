/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../model/login_flow_model_current.dart';

import 'login_flow_repository_ss.dart';

class LoginFlowRepositoryCurrent
    extends LoginFlowRepositorySS<LoginFlowModelCurrent> {
  static const String key = "user";
  static const String _table = "current";
  static const String _version = "0.0.1";

  LoginFlowRepositoryCurrent({FlutterSecureStorage? secureStorage})
      : super(
            table: _table,
            version: _version,
            toJson: (LoginFlowModelCurrent model) => model.toJson(),
            fromJson: (Map<String, dynamic>? json) =>
                LoginFlowModelCurrent.fromJson(json),
            secureStorage: secureStorage);
}
