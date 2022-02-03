/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:httpp/httpp.dart';

import 'api_bouncer_repository_jwt.dart';
import 'api_bouncer_repository_otp.dart';
import 'model/api_bouncer_model_jwt_req_otp.dart';
import 'model/api_bouncer_model_jwt_req_refresh.dart';
import 'model/api_bouncer_model_jwt_rsp.dart';
import 'model/api_bouncer_model_otp_req.dart';
import 'model/api_bouncer_model_otp_rsp.dart';
import 'model/api_bouncer_model_rsp.dart';

class ApiBouncerService {
  final HttppClient _httpp;
  final ApiBouncerRepositoryJwt _repositoryJwt;
  final ApiBouncerRepositoryOtp _repositoryOtp;

  ApiBouncerService({Httpp? httpp})
      : _httpp = httpp?.client() ?? Httpp().client(),
        _repositoryJwt = ApiBouncerRepositoryJwt(),
        _repositoryOtp = ApiBouncerRepositoryOtp();

  Future<void> refresh(
          {required String refreshToken,
          void Function(ApiBouncerModelRsp<ApiBouncerModelJwtRsp>)? onSuccess,
          void Function(Object)? onError}) =>
      _repositoryJwt.refresh(
          client: _httpp,
          body: ApiBouncerModelJwtReqRefresh(refreshToken),
          onSuccess: onSuccess,
          onError: onError);

  Future<void> token(
          {required String otp,
          required String salt,
          void Function(ApiBouncerModelRsp<ApiBouncerModelJwtRsp>)? onSuccess,
          void Function(Object)? onError}) =>
      _repositoryJwt.otp(
          client: _httpp,
          body: ApiBouncerModelJwtReqOtp(otp, salt),
          onSuccess: onSuccess,
          onError: onError);

  Future<void> otp(
          {required String email,
          void Function(ApiBouncerModelRsp<ApiBouncerModelOtpRsp>)? onSuccess,
          void Function(Object)? onError}) =>
      _repositoryOtp.email(
          client: _httpp,
          body: ApiBouncerModelOtpReq(email),
          onSuccess: onSuccess,
          onError: onError);
}
