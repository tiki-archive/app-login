/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/login_flow_model_user.dart';
import 'login_flow_repository_ss.dart';

class LoginFlowRepositoryUser
    extends LoginFlowRepositorySS<LoginFlowModelUser> {
  static const String _table = "user";
  static const String _version = "0.0.1";

  LoginFlowRepositoryUser({FlutterSecureStorage? secureStorage})
      : super(
            table: _table,
            version: _version,
            toJson: (LoginFlowModelUser model) => model.toJson(),
            fromJson: (Map<String, dynamic>? json) =>
                LoginFlowModelUser.fromJson(json),
            secureStorage: secureStorage);
}
