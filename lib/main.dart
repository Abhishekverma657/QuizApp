import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentor_quiz_app_tut/AuthPage.dart';
import 'package:flutter_mentor_quiz_app_tut/home.dart';
import 'package:flutter_mentor_quiz_app_tut/signup.dart';

import 'firebase_options.dart';
import 'firstpage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz  App',
      theme: ThemeData(
        primaryColor: Color(0xFF55C1EF),
      ),
      home: Signin(),
    );
  }
}
