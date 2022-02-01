/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'login_flow_model_current.dart';
import 'login_flow_model_otp.dart';
import 'login_flow_model_state.dart';
import 'login_flow_model_token.dart';
import 'login_flow_model_user.dart';

class LoginFlowModel {
  LoginFlowModelCurrent? current;
  LoginFlowModelUser? user;
  LoginFlowModelToken? token;
  LoginFlowModelOtp? otp;

  LoginFlowModelState? state;

  LoginFlowModel(
      {this.current,
      this.user,
      this.token,
      this.otp,
      this.state = LoginFlowModelState.returningUser});
}
