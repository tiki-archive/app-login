/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'api_bouncer_model_rsp_message.dart';
import 'api_bouncer_model_rsp_page.dart';

class ApiBouncerModelRsp<T> {
  String? status;
  int? code;
  dynamic data;
  ApiBouncerModelRspPage? page;
  List<ApiBouncerModelRspMessage>? messages;

  ApiBouncerModelRsp(
      {this.status, this.code, this.data, this.page, this.messages});

  ApiBouncerModelRsp.fromJson(Map<String, dynamic>? json,
      T Function(Map<String, dynamic>? json) fromJson) {
    if (json != null) {
      status = json['status'];
      code = json['code'];

      if (json['data'] != null) {
        data = json['data'] is List
            ? json['data'].map((e) => fromJson(e)).toList()
            : fromJson(json['data']);
      }

      if (json['page'] != null) {
        page = ApiBouncerModelRspPage().fromJson(json['page']);
      }

      if (json['messages'] != null) {
        messages = (json['messages'] as List)
            .map((e) => ApiBouncerModelRspMessage.fromJson(e))
            .toList();
      }
    }
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'data': data?.toJson(),
        'page': page?.toJson(),
        'messages': messages?.map((e) => e.toJson()).toList()
      };
}
