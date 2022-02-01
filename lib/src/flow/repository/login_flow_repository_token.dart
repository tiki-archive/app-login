/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/login_flow_model_token.dart';
import 'login_flow_repository_ss.dart';

class LoginFlowRepositoryToken
    extends LoginFlowRepositorySS<LoginFlowModelToken> {
  static const String _table = "token";
  static const String _version = "0.0.1";

  LoginFlowRepositoryToken({FlutterSecureStorage? secureStorage})
      : super(
            table: _table,
            version: _version,
            toJson: (LoginFlowModelToken model) => model.toJson(),
            fromJson: (Map<String, dynamic>? json) =>
                LoginFlowModelToken.fromJson(json),
            secureStorage: secureStorage);
}
