/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class ApiBouncerModelRspMessage {
  int? code;
  String? status;
  String? message;
  Map<String, String>? properties;

  ApiBouncerModelRspMessage.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      code = json['code'];
      status = json['status'];
      message = json['message'];
      if (json['properties'] != null) properties = Map.from(json['properties']);
    }
  }

  Map<String, dynamic> toJson() => {
        'size': code,
        'status': status,
        'message': message,
        'properties': properties
      };
}
