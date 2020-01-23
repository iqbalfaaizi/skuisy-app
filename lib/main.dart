import 'package:flutter/material.dart';
import 'package:skuisy_project/ui/screens/home_page.dart';
import 'package:skuisy_project/ui/screens/auth/login_page.dart';
import 'package:skuisy_project/ui/screens/auth/signup_page.dart';
import 'package:skuisy_project/ui/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    SignupPage.tag: (context) => SignupPage()
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent
      ),
      home: HomePage(),
      routes: routes
    );
  }
}

