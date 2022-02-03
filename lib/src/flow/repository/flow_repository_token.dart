/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/flow_model_token.dart';
import 'flow_repository_ss.dart';

class FlowRepositoryToken extends FlowRepositorySS<FlowModelToken> {
  static const String _table = "token";
  static const String _version = "0.0.1";

  FlowRepositoryToken({FlutterSecureStorage? secureStorage})
      : super(
            table: _table,
            version: _version,
            toJson: (FlowModelToken model) => model.toJson(),
            fromJson: (Map<String, dynamic>? json) =>
                FlowModelToken.fromJson(json),
            secureStorage: secureStorage);
}
