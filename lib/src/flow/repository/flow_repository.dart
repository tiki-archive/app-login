/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/flow_model.dart';
import '../model/flow_model_current.dart';
import '../model/flow_model_otp.dart';
import '../model/flow_model_token.dart';
import '../model/flow_model_user.dart';
import 'flow_repository_current.dart';
import 'flow_repository_otp.dart';
import 'flow_repository_token.dart';
import 'flow_repository_user.dart';

class FlowRepository {
  final FlowRepositoryCurrent _repositoryCurrent;
  final FlowRepositoryUser _repositoryUser;
  final FlowRepositoryOtp _repositoryOtp;
  final FlowRepositoryToken _repositoryToken;

  FlowRepository({FlutterSecureStorage? secureStorage})
      : _repositoryCurrent =
            FlowRepositoryCurrent(secureStorage: secureStorage),
        _repositoryUser = FlowRepositoryUser(secureStorage: secureStorage),
        _repositoryOtp = FlowRepositoryOtp(secureStorage: secureStorage),
        _repositoryToken = FlowRepositoryToken(secureStorage: secureStorage);

  Future<FlowModel> get() async {
    FlowModel model = FlowModel();
    model.current = await _repositoryCurrent.find(FlowRepositoryCurrent.key);
    if (model.current?.email != null) {
      model.user = await _repositoryUser.find(model.current!.email!);
      model.token = await _repositoryToken.find(model.current!.email!);
      model.otp = await _repositoryOtp.find(model.current!.email!);
    }
    return model;
  }

  Future<FlowModelCurrent> saveCurrent(String email) async {
    await _repositoryCurrent.save(
        FlowRepositoryCurrent.key, FlowModelCurrent(email: email));
    return FlowModelCurrent(email: email);
  }

  Future<FlowModelUser> saveUser(FlowModelUser user) async {
    if (user.email == null)
      throw ArgumentError(
          "Attempting to write to user without an email. Skipping");
    else {
      await _repositoryUser.save(user.email!, user);
      return user;
    }
  }

  Future<FlowModelUser> getUser(String email) => _repositoryUser.find(email);

  Future<FlowModelToken> saveToken(String email, FlowModelToken token) async {
    await _repositoryToken.save(email, token);
    return token;
  }

  Future<FlowModelOtp> saveOtp(FlowModelOtp otp) async {
    if (otp.email == null)
      throw ArgumentError(
          "Attempting to write to otp without an email. Skipping");
    else {
      await _repositoryOtp.save(otp.email!, otp);
      return otp;
    }
  }
}
