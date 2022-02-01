import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) => print(
        '${record.time.toIso8601String()}: ${record.level.name} [${record.loggerName}] ${record.message}'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Router(
            routerDelegate: Login(
                style: LoginFlowStyle(
              intro: LoginScreenIntroStyle(
                  backgroundColor1: Color(0xFFFFD225),
                  backgroundColor2: Color(0xFFFFD976),
                  backgroundColor3: Color(0xFFFFC376),
                  buttonColor: Color(0xFF27002E),
                  buttonTextColor: Color(0xFFFFFFFF),
                  textColor: Color(0xFF27002E),
                  skipColor: Color(0xFF00133F),
                  dotColor: Color(0xFFFFFFFF),
                  dotColorActive: Color(0xFF27002E),
                  textFamily: 'NunitoSans',
                  titleFamily: 'Koara'),
              email: LoginScreenEmailStyle(),
              inbox: LoginScreenInboxStyle(),
              terms: LoginScreenTermsStyle(),
            )).routerDelegate,
            backButtonDispatcher: RootBackButtonDispatcher()));
  }
}
