import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) => print(
      '${record.time.toIso8601String()}: ${record.level.name} [${record.loggerName}] ${record.message}'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Router(
            routerDelegate: Login(
                style: FlowStyle(
              intro: ScreenIntroStyle(
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
              email: ScreenEmailStyle(
                  errorColor: Color(0xFFC73000),
                  buttonColor: Color(0xFF27002E),
                  textColor: Color(0xFF545454),
                  backgroundColor: Color(0xFFFFF5E9),
                  buttonTextColor: Color(0xFFFFFFFF),
                  hintColor: Color(0xFF8D8D8D),
                  linkColor: Color(0xFFFF521C),
                  titleColor: Color(0xFF27002E),
                  textFamily: 'NunitoSans',
                  titleFamily: 'Koara'),
              inbox: ScreenInboxStyle(
                  buttonColor: Color(0xFFFF521C),
                  backgroundColor: Color(0xFFFFF5E9),
                  textColor: Color(0xFF545454),
                  titleColor: Color(0xFF27002E),
                  textFamily: 'NunitoSans',
                  titleFamily: 'Koara'),
              terms: ScreenTermsStyle(
                  backgroundColor: Color(0xFFFFF5E9),
                  textColor: Color(0xFF545454),
                  headingColor: Color(0xFF27002E),
                  linkColor: Color(0xFFFF521C),
                  titleFamily: 'Koara',
                  textFamily: 'NunitoSans'),
            )).routerDelegate,
            backButtonDispatcher: RootBackButtonDispatcher()));
  }
}
