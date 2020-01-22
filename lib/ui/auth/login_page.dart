import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _showPass = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      style: TextStyle(color: Color(0xff800000)),
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: TextStyle(color: Color(0xff800000)),
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff800000), width: 2.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        prefixIcon: Icon(Icons.mail, color: Color(0xff800000)),
      ),
    );

    final password = TextFormField(
      controller: _passCtrl,
      obscureText: !_showPass ?? true,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autofocus: false,
      style: TextStyle(color: Color(0xff800000)),
      decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Color(0xff800000)),
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff800000), width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          prefixIcon: Icon(Icons.vpn_key, color: Color(0xff800000)),
          suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye,
              color: Color(0xff800000),
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _showPass == false ? _showPass = true : _showPass = false;
              });
            },
          )
        ),
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
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                email,
                SizedBox(height: 20),
                password
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
