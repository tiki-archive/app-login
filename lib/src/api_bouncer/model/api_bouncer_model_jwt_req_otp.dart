/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class ApiBouncerModelJwtReqOtp {
  String? otp;
  String? salt;

  ApiBouncerModelJwtReqOtp(this.otp, this.salt);

  ApiBouncerModelJwtReqOtp.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      otp = json['otp'];
      salt = json['salt'];
    }
  }

  Map<String, dynamic> toJson() => {'otp': otp, 'salt': salt};
}
