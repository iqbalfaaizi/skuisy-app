import 'package:flutter/material.dart';
import 'package:skuisy_project/data/bloc/navigation_bloc.dart';
import 'package:skuisy_project/src/api_service.dart';
import 'package:skuisy_project/ui/screens/auth/signup_page.dart';
import 'package:skuisy_project/src/global_functions.dart';
import 'package:skuisy_project/ui/screens/navigator_page.dart';
import 'package:skuisy_project/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalFunctions func = new GlobalFunctions();
  final _formKey = GlobalKey<FormState>();
  bool _showPass = false;
  ApiService _apiService = new ApiService();
  String email = '';
  String password = '';

  void autoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String user = prefs.getString('email');
    print('sharedpreference $user');
    if (user != null) {
      setState(() {
        email = user;
      });
      navBlocs.updateEmail(user);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavigatorPage()));
      print('autologin success');
    }
  }

  onButtonPressed() async {
    if (_formKey.currentState.validate()) {
      final res = await _apiService.logIn(email, password);

      print(res.toString());
      if (res.toString() == 'success') {
        await loginUser();
        func.alertDialog(context, 'Successfully Login');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavigatorPage()));
      }
    }
  }

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    print('Store preferences email : ${prefs.getString('email')}');
    // print('Store pref : $prefs');
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      validator: (val) => Val.ValidateEmail(val),
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      style: TextStyle(color: Color(0xff800000)),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle:
            TextStyle(color: Color(0xff800000), fontFamily: 'sans-serif-light'),
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff800000), width: 2.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        prefixIcon: Icon(Icons.mail, color: Color(0xff800000)),
      ),
      onChanged: (text) {
        setState(() {
          this.email = text;
        });
      },
    );

    final password = TextFormField(
      validator: (val) => Val.ValidatePassword(val),
      obscureText: !_showPass ?? true,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autofocus: false,
      style: TextStyle(color: Color(0xff800000)),
      onChanged: (text) {
        setState(() {
          this.password = text;
        });
      },
      decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
              color: Color(0xff800000), fontFamily: 'sans-serif-light'),
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff800000), width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          prefixIcon: Icon(Icons.vpn_key, color: Color(0xff800000)),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: Color(0xff800000),
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _showPass == false ? _showPass = true : _showPass = false;
              });
            },
          )),
    );

    final _buildBody = Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Color(0xff800000),
                      fontSize: 40,
                      fontFamily: 'LemonMilk'),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                email,
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                password,
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                func.authButtons(context, 'LOGIN', 'login', onButtonPressed),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Want to join?',
                      style: TextStyle(color: Color(0xff800000)),
                    ),
                    FlatButton(
                      child: Text(
                        'SIGN UP HERE',
                        style: TextStyle(
                            color: Color(0xff800000),
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(SignupPage.tag),
                    )
                  ],
                )
              ]),
            ),
          ],
        ));

    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xff800000)),
      home: Scaffold(backgroundColor: Colors.white, body: _buildBody),
    );
  }
}
