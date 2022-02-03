/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class FlowModelToken {
  String? bearer;
  String? refresh;
  DateTime? expires;

  FlowModelToken({this.bearer, this.refresh, this.expires});

  FlowModelToken.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      this.bearer = json['bearer'];
      this.refresh = json['refresh'];
      if (json['expires_epoch'] != null)
        this.expires =
            DateTime.fromMillisecondsSinceEpoch(json['expires_epoch']);
    }
  }

  Map<String, dynamic> toJson() => {
        'bearer': bearer,
        'refresh': refresh,
        'expires_epoch': expires?.millisecondsSinceEpoch,
      };
}
