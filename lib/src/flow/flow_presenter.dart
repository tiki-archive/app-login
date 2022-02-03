/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'flow_layout.dart';
import 'flow_service.dart';

class FlowPresenter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey;
  final FlowService service;

  FlowPresenter(this.service) : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: service, child: FlowLayout(navigatorKey: navigatorKey));
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
