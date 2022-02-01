/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import '../model/login_flow_model_current.dart';
import '../model/login_flow_model_otp.dart';
import '../model/login_flow_model_token.dart';

import '../model/login_flow_model.dart';
import '../model/login_flow_model_user.dart';
import 'login_flow_repository_current.dart';
import 'login_flow_repository_otp.dart';
import 'login_flow_repository_token.dart';
import 'login_flow_repository_user.dart';

class LoginFlowRepository {
  final Logger _log = Logger('LoginFlowRepository');
  final LoginFlowRepositoryCurrent _repositoryCurrent;
  final LoginFlowRepositoryUser _repositoryUser;
  final LoginFlowRepositoryOtp _repositoryOtp;
  final LoginFlowRepositoryToken _repositoryToken;

  LoginFlowRepository({FlutterSecureStorage? secureStorage})
      : _repositoryCurrent =
            LoginFlowRepositoryCurrent(secureStorage: secureStorage),
        _repositoryUser = LoginFlowRepositoryUser(secureStorage: secureStorage),
        _repositoryOtp = LoginFlowRepositoryOtp(secureStorage: secureStorage),
        _repositoryToken =
            LoginFlowRepositoryToken(secureStorage: secureStorage);

  Future<LoginFlowModel> get() async {
    LoginFlowModel model = LoginFlowModel();
    model.current =
        await _repositoryCurrent.find(LoginFlowRepositoryCurrent.key);
    if (model.current?.email != null) {
      model.user = await _repositoryUser.find(model.current!.email!);
      model.token = await _repositoryToken.find(model.current!.email!);
      model.otp = await _repositoryOtp.find(model.current!.email!);
    }
    return model;
  }

  Future<void> setCurrent(String email) async {
    await _repositoryCurrent.save(
        LoginFlowRepositoryCurrent.key, LoginFlowModelCurrent(email: email));
  }

  Future<void> setUser(LoginFlowModelUser user) async {
    if (user.email == null)
      _log.warning("Attempting to write to user without an email. Skipping");
    else
      await _repositoryUser.save(user.email!, user);
  }

  Future<void> setToken(String email, LoginFlowModelToken token) async {
    await _repositoryToken.save(email, token);
  }

  Future<void> setOtp(LoginFlowModelOtp otp) async {
    if (otp.email == null)
      _log.warning("Attempting to write to otp without an email. Skipping");
    else
      await _repositoryOtp.save(otp.email!, otp);
  }
}
