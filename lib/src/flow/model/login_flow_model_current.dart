/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class LoginFlowModelCurrent {
  String? email;

  LoginFlowModelCurrent({required this.email});

  LoginFlowModelCurrent.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      this.email = json['email'];
    }
  }

  Map<String, dynamic> toJson() => {'email': email};
}
