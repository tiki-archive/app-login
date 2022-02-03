/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

enum FlowModelState {
  returningUser,
  otpRequested,
  otpVerified,
  setupKeys,
  loggedIn
}
