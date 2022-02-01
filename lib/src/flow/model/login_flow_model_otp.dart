/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class LoginFlowModelOtp {
  String? email;
  String? salt;

  LoginFlowModelOtp({this.email, this.salt});

  LoginFlowModelOtp.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      this.email = json['email'];
      this.salt = json['salt'];
    }
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'salt': salt,
      };
}
