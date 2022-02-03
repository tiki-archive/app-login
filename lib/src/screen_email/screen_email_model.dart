/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class ScreenEmailModel {
  String? email;
  bool canSubmit;
  bool isError;

  ScreenEmailModel({this.email, this.canSubmit = false, this.isError = false});
}
