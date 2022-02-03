/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/flow_model_current.dart';
import 'flow_repository_ss.dart';

class FlowRepositoryCurrent extends FlowRepositorySS<FlowModelCurrent> {
  static const String key = "user";
  static const String _table = "current";
  static const String _version = "0.0.1";

  FlowRepositoryCurrent({FlutterSecureStorage? secureStorage})
      : super(
            table: _table,
            version: _version,
            toJson: (FlowModelCurrent model) => model.toJson(),
            fromJson: (Map<String, dynamic>? json) =>
                FlowModelCurrent.fromJson(json),
            secureStorage: secureStorage);
}
