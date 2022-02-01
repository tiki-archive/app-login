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
    WidgetsFlutterBinding.ensureInitialized();
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
              email: LoginScreenEmailStyle(
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
              inbox: LoginScreenInboxStyle(),
              terms: LoginScreenTermsStyle(
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
