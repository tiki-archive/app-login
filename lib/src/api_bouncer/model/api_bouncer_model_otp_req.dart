/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class ApiBouncerModelOtpReq {
  String? email;

  ApiBouncerModelOtpReq(this.email);

  ApiBouncerModelOtpReq.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      this.email = json['email'];
    }
  }

  Map<String, dynamic> toJson() => {"email": email};
}
