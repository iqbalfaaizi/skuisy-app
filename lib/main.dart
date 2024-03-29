import 'package:flutter/material.dart';
import 'package:skuisy_project/ui/screens/auth/login_page.dart';
import 'package:skuisy_project/ui/screens/auth/signup_page.dart';
import 'package:skuisy_project/ui/screens/navigator_page.dart';
import 'package:skuisy_project/ui/screens/product_details.dart';
import 'package:skuisy_project/ui/screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    SignupPage.tag: (context) => SignupPage(),
    ProductDetails.tag: (context) => ProductDetails(description: null, id: null, picture: null, price: null, seller: null, stock: null, title: null,)
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Home Page',
      home: Splash(),
      routes: routes
    );
  }
}

