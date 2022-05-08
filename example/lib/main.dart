/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';
import 'package:tiki_login/tiki_login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) => print(
      '${record.time.toIso8601String()}: ${record.level.name} [${record.loggerName}] ${record.message}'));

  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Httpp httpp = Httpp();
  TikiLogin login =
      TikiLogin(httpp: httpp, secureStorage: secureStorage, home: Home());
  await login.init();

  runApp(MyApp(login.routerDelegate));
}

class MyApp extends StatelessWidget {
  final RouterDelegate _routerDelegate;

  const MyApp(this._routerDelegate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Router(
            routerDelegate: _routerDelegate,
            backButtonDispatcher: RootBackButtonDispatcher()));
  }
}

class Home extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) => Center(child: Text('Home')));
  }
}
