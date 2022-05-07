import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:tiki_login/tiki_login.dart';

import 'app.dart';

Future<void> main() async {
  await _libsInit();
  TikiLogin login = await _loginInit();
  return runApp(App(login.routerDelegate));
}


Future<void> _libsInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) => print(
      '${record.time.toIso8601String()}: ${record.level.name} [${record.loggerName}] ${record.message}'));
  await Firebase.initializeApp();
}

Future<TikiLogin> _loginInit() async {
  MaterialPage home = MaterialPage(child: Container(child: Center(child:Text('Logged In'))));
  TikiLogin login = TikiLogin(home: home);
  await login.init();
  return login;
}

