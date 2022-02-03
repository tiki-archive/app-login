/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/flow_model_user.dart';
import 'flow_repository_ss.dart';

class FlowRepositoryUser extends FlowRepositorySS<FlowModelUser> {
  static const String _table = "user";
  static const String _version = "0.0.1";

  FlowRepositoryUser({FlutterSecureStorage? secureStorage})
      : super(
            table: _table,
            version: _version,
            toJson: (FlowModelUser model) => model.toJson(),
            fromJson: (Map<String, dynamic>? json) =>
                FlowModelUser.fromJson(json),
            secureStorage: secureStorage);
}
