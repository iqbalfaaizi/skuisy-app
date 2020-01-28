import 'package:flutter/material.dart';
import 'package:skuisy_project/src/global_functions.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  GlobalFunctions func = new GlobalFunctions();

  final logo = CircleAvatar(
    backgroundColor: Colors.transparent,
    radius: 48.0,
    child: Image.asset(
      'assets/logo.png',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          // color: Color(0xffFF003D),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover
            )
          ),
          child: Center(child: logo),
        ),
        bottomSheet: Container(
          color: Color(0xff800000),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              func.landingButtons(context, 'LOGIN', 'login-page'),
              func.landingButtons(context, 'SIGNUP', 'signup-page')
            ],
          ),
        ));
  }
}
