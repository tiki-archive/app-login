/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

class FlowModelCurrent {
  String? email;

  FlowModelCurrent({required this.email});

  FlowModelCurrent.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      this.email = json['email'];
    }
  }

  Map<String, dynamic> toJson() => {'email': email};
}
