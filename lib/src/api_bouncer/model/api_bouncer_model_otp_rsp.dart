/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class ApiBouncerModelOtpRsp {
  String? salt;
  DateTime? issued;
  DateTime? expires;

  ApiBouncerModelOtpRsp(this.salt, {this.issued, this.expires});

  ApiBouncerModelOtpRsp.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      this.salt = json['salt'];
      this.issued = DateTime.parse(json['issued']);
      this.expires = DateTime.parse(json['expires']);
    }
  }

  Map<String, dynamic> toJson() => {
        'salt': salt,
        'issued': issued?.toUtc().toIso8601String(),
        'expires': expires?.toUtc().toIso8601String()
      };
}
