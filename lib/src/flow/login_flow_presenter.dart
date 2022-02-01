/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'login_flow_layout.dart';
import 'login_flow_service.dart';

class LoginFlowPresenter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey;
  final LoginFlowService service;

  LoginFlowPresenter(this.service) : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: service, child: LoginFlowLayout(navigatorKey: navigatorKey));
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
