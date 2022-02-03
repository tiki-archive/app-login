/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'flow_model_current.dart';
import 'flow_model_otp.dart';
import 'flow_model_state.dart';
import 'flow_model_token.dart';
import 'flow_model_user.dart';

class FlowModel {
  FlowModelCurrent? current;
  FlowModelUser? user;
  FlowModelToken? token;
  FlowModelOtp? otp;

  FlowModelState? state;
  bool otpError;

  FlowModel(
      {this.current,
      this.user,
      this.token,
      this.otp,
      this.state,
      this.otpError = false});
}
