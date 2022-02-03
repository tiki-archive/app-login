/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';

import 'model/api_bouncer_model_otp_req.dart';
import 'model/api_bouncer_model_otp_rsp.dart';
import 'model/api_bouncer_model_rsp.dart';

class ApiBouncerRepositoryOtp {
  final Logger _log = Logger('ApiBouncerRepositoryOtp');
  static const String _path = 'https://bouncer.mytiki.com/api/latest/otp/email';

  Future<void> email(
      {required HttppClient client,
      ApiBouncerModelOtpReq? body,
      void Function(ApiBouncerModelRsp<ApiBouncerModelOtpRsp>)? onSuccess,
      void Function(Object)? onError}) {
    HttppRequest request = HttppRequest(
        uri: Uri.parse(_path),
        verb: HttppVerb.POST,
        headers: HttppHeaders.typical(),
        body: HttppBody.fromJson(body?.toJson()),
        timeout: Duration(seconds: 30),
        onSuccess: (rsp) {
          if (onSuccess != null)
            onSuccess(ApiBouncerModelRsp.fromJson(rsp.body?.jsonBody,
                (json) => ApiBouncerModelOtpRsp.fromJson(json)));
        },
        onResult: (rsp) {
          if (onError != null)
            onError(ApiBouncerModelRsp.fromJson(rsp.body?.jsonBody, (json) {}));
        },
        onError: onError);
    _log.finest('${request.verb.value} — ${request.uri}');
    return client.request(request);
  }
}
