import 'package:flutter/material.dart';
import 'package:skuisy_project/ui/src/global_functions.dart';

class SignupPage extends StatefulWidget {
  static String tag = 'signup-page';
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _repassCtrl = TextEditingController();
  bool _showPass = false, _rePass = false;
  GlobalFunctions func = new GlobalFunctions();

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        prefixIcon: Icon(Icons.mail, color: Colors.white60),
      ),
    );

    final password = TextFormField(
      controller: _passCtrl,
      keyboardType: TextInputType.text,
      obscureText: !_showPass ?? true,
      autofocus: false,
      textCapitalization: TextCapitalization.none,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        prefixIcon: Icon(Icons.vpn_key, color: Colors.white60),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: Colors.white60,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _showPass == false ? _showPass = true : _showPass = false;
            });
          },
        ),
      ),
    );

    final repassword = TextFormField(
        controller: _repassCtrl,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.none,
        obscureText: !_rePass ?? true,
        autofocus: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Re-Type Password',
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          prefixIcon: Icon(Icons.vpn_key, color: Colors.white60),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: Colors.white60,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _rePass == false ? _rePass = true : _rePass = false;
              });
            },
          ),
        ));

    final _buildBody = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Text(
                'SIGN UP',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              email,
              SizedBox(height: 20),
              password,
              SizedBox(height: 20),
              repassword,
              SizedBox(height: 50),
            ]),
          ),
        ],
      ),
    );

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        backgroundColor: Color(0xff800000), 
        body: _buildBody
      ),
    );
  }
}
