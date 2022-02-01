/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import '../screen_intro/login_screen_intro_style.dart';

class LoginFlowStyle {
  LoginScreenIntroStyle intro;

  LoginFlowStyle({LoginScreenIntroStyle? intro})
      : this.intro = intro ?? LoginScreenIntroStyle();
}
