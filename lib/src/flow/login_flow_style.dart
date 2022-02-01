/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import '../screen_email/login_screen_email_style.dart';
import '../screen_inbox/login_screen_inbox_style.dart';
import '../screen_intro/login_screen_intro_style.dart';
import '../screen_terms/login_screen_terms_style.dart';

class LoginFlowStyle {
  LoginScreenIntroStyle intro;
  LoginScreenTermsStyle terms;
  LoginScreenInboxStyle inbox;
  LoginScreenEmailStyle email;

  LoginFlowStyle(
      {LoginScreenIntroStyle? intro,
      LoginScreenTermsStyle? terms,
      LoginScreenInboxStyle? inbox,
      LoginScreenEmailStyle? email})
      : this.intro = intro ?? LoginScreenIntroStyle(),
        this.terms = terms ?? LoginScreenTermsStyle(),
        this.inbox = inbox ?? LoginScreenInboxStyle(),
        this.email = email ?? LoginScreenEmailStyle();
}
