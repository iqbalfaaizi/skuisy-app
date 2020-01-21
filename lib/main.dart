import 'package:flutter/material.dart';
import 'package:skuisy_project/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: Colors.yellow
      ),
      home: HomePage(),
    );
  }
}

