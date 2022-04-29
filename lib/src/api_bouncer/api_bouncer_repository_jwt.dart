/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';

import 'model/api_bouncer_model_jwt_req_otp.dart';
import 'model/api_bouncer_model_jwt_req_refresh.dart';
import 'model/api_bouncer_model_jwt_rsp.dart';
import 'model/api_bouncer_model_rsp.dart';

class ApiBouncerRepositoryJwt {
  final Logger _log = Logger('ApiBouncerRepositoryJwt');
  static const String _path = 'https://bouncer.mytiki.com/api/latest/jwt';
  static const String _pathOtp = _path + '/otp';
  static const String _pathRefresh = _path + '/refresh';

  Future<void> otp(
      {required HttppClient client,
      ApiBouncerModelJwtReqOtp? body,
      void Function(ApiBouncerModelRsp<ApiBouncerModelJwtRsp>)? onSuccess,
      void Function(Object)? onError}) {
    HttppRequest request = HttppRequest(
        uri: Uri.parse(_pathOtp),
        verb: HttppVerb.POST,
        headers: HttppHeaders.typical(),
        body: HttppBody.fromJson(body?.toJson()),
        timeout: const Duration(seconds: 30),
        onSuccess: (rsp) {
          if (onSuccess != null) {
            onSuccess(ApiBouncerModelRsp.fromJson(rsp.body?.jsonBody,
                (json) => ApiBouncerModelJwtRsp.fromJson(json)));
          }
        },
        onResult: (rsp) {
          if (onError != null) {
            onError(ApiBouncerModelRsp.fromJson(rsp.body?.jsonBody, (json) {}));
          }
        },
        onError: onError);
    _log.finest('${request.verb.value} — ${request.uri}');
    return client.request(request);
  }

  Future<void> refresh(
      {required HttppClient client,
      ApiBouncerModelJwtReqRefresh? body,
      void Function(ApiBouncerModelRsp<ApiBouncerModelJwtRsp>)? onSuccess,
      void Function(Object)? onError}) {
    HttppRequest request = HttppRequest(
        uri: Uri.parse(_pathRefresh),
        verb: HttppVerb.POST,
        headers: HttppHeaders.typical(),
        body: HttppBody.fromJson(body?.toJson()),
        timeout: const Duration(seconds: 30),
        onSuccess: (rsp) {
          if (onSuccess != null) {
            onSuccess(ApiBouncerModelRsp.fromJson(rsp.body?.jsonBody,
                (json) => ApiBouncerModelJwtRsp.fromJson(json)));
          }
        },
        onResult: (rsp) {
          if (onError != null) {
            onError(ApiBouncerModelRsp.fromJson(rsp.body?.jsonBody, (json) {}));
          }
        },
        onError: onError);
    _log.finest('${request.verb.value} — ${request.uri}');
    return client.request(request);
  }
}
