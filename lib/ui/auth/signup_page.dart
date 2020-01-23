import 'package:flutter/material.dart';
import 'package:skuisy_project/src/api_service.dart';
import 'package:skuisy_project/ui/auth/login_page.dart';
import 'package:skuisy_project/src/global_functions.dart';
import 'package:dio/dio.dart';
import 'package:skuisy_project/utils/utils.dart';

Dio dio = new Dio();
GlobalFunctions func = new GlobalFunctions();

class SignupPage extends StatefulWidget {
  static String tag = 'signup-page';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  ApiService _apiService = new ApiService();
  final _formKey = GlobalKey<FormState>();
  bool _showPass = false, _rePass = false;
  String email = '';
  String password = '';
  String repassword = '';

  onButtonPressed() async {
    if (_formKey.currentState.validate()) {
      if(password != repassword) {
        func.alertDialog(context, 'Re-Type Password did not match!');
      } else {
        final res = await _apiService.signUp(email, password);
        if(res.toString() == 'success') {
          Navigator.of(context).pushNamed(LoginPage.tag);
          func.alertDialog(context, 'Successfully Registered');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      validator: (val) => Val.ValidateEmail(val),
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      onChanged: (text) {
        setState(() {
          this.email = text;
        });
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.white, fontFamily: 'sans-serif-light'),
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        prefixIcon: Icon(Icons.mail, color: Colors.white60),
        errorStyle: TextStyle(color: Colors.yellow)
      ),
    );

    final password = TextFormField(
      validator: (val) => Val.ValidatePassword(val),
      keyboardType: TextInputType.text,
      obscureText: !_showPass ?? true,
      autofocus: false,
      textCapitalization: TextCapitalization.none,
      onChanged: (text) {
        setState(() {
          this.password = text;
        });
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.white, fontFamily: 'sans-serif-light'),
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        prefixIcon: Icon(Icons.lock, color: Colors.white60),
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
        errorStyle: TextStyle(color: Colors.yellow)
      ),
    );

    final repassword = TextFormField(
        validator: (val) => Val.ValidatePassword(val),
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.none,
        obscureText: !_rePass ?? true,
        autofocus: false,
        onChanged: (text) {
          setState(() {
            this.repassword = text;
          });
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: 'Re-Type Password',
          labelStyle: TextStyle(color: Colors.white, fontFamily: 'sans-serif-light'),
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          prefixIcon: Icon(Icons.lock, color: Colors.white60),
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
          errorStyle: TextStyle(color: Colors.yellow)
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
                    color: Colors.white, fontSize: 40, fontFamily: 'LemonMilk'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              email,
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              password,
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              repassword,
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              func.authButtons(context, 'SIGN UP', 'signup', onButtonPressed),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already registered?',
                    style: TextStyle(color: Colors.white),
                  ),
                  FlatButton(
                    child: Text(
                      'LOGIN HERE',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(LoginPage.tag),
                  )
                ],
              )
            ]),
          ),
        ],
      ),
    );

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        backgroundColor: Color(0xff800000),
        body: _buildBody,
      ),
    );
  }
}
