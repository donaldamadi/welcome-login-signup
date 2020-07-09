import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/Welcome/welcome_screen.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
