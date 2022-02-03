/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/flow_model_otp.dart';
import 'flow_repository_ss.dart';

class FlowRepositoryOtp extends FlowRepositorySS<FlowModelOtp> {
  static const String _table = "otp";
  static const String _version = "0.0.1";

  FlowRepositoryOtp({FlutterSecureStorage? secureStorage})
      : super(
            table: _table,
            version: _version,
            toJson: (FlowModelOtp model) => model.toJson(),
            fromJson: (Map<String, dynamic>? json) =>
                FlowModelOtp.fromJson(json),
            secureStorage: secureStorage);
}
