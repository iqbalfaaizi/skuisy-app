import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skuisy_project/ui/screens/navigator_page.dart';
import 'package:getflutter/getflutter.dart';
import 'package:skuisy_project/utils/utils.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Prefs _prefs = new Prefs();
  String email;
  bool _logout = false;

  @override
  void initState() {
    this._userEmail();
    super.initState();
  }
  
  void _userEmail() async {
    final usermail = await _prefs.getEmail();
    setState(() {
      email = usermail;
    });
  }

  Future<Null> logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', null);
    print('Store preferences email : ${prefs.getString('email')}');
    Timer(Duration(seconds: 1),
    () => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NavigatorPage()))
    );
  }

  Widget _testToast() {
    return Container(
      child: Opacity(
        opacity: 0.8,
        child:GFToast(
          text: 'Successfully logged out',
          type: GFToastType.rounded,
          autoDismiss: true,
        )
      )
    );
  }

  Widget _onPressedLogout() {
    logOut();
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.3,
          child: ModalBarrier(dismissible: false, color: Colors.grey,),
        ),
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
      child: Card(
        child: Container(
          height: 100,
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: email == null ? Text('Please login or signup first.', textAlign: TextAlign.center) :
                        GFButton(
                          onPressed: (){
                            setState(() {
                              _logout = true;
                            });
                          },
                          text: 'Logout',
                          shape: GFButtonShape.pills,
                          type: GFButtonType.solid,
                          color: GFColor.danger,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _logout ? _onPressedLogout() : _buildBody(),
      bottomSheet: _logout ? ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20),
        children: <Widget>[
          _testToast(),
        ],
      ) : null
    );
  }
}
