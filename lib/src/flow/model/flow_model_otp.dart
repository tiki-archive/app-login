/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class FlowModelOtp {
  String? email;
  String? salt;

  FlowModelOtp({this.email, this.salt});

  FlowModelOtp.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      email = json['email'];
      salt = json['salt'];
    }
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'salt': salt,
      };
}
