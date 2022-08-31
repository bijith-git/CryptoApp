import 'package:cryptoapp/config/constants.dart';
import 'package:cryptoapp/firebase_options.dart';
import 'package:cryptoapp/screens/login_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "MYRIADPRO",
        scaffoldBackgroundColor: kBlack,
      ),
      home: const LoginScreen(),
    );
  }
}
