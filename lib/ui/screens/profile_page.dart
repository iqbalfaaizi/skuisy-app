import 'package:flutter/material.dart';
import 'package:skuisy_project/data/bloc/navigation_bloc.dart';
import 'package:skuisy_project/ui/landing_page.dart';
import 'package:skuisy_project/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final String email = navBlocs.navigationProvider.currentEmail;
  Prefs _prefs = new Prefs();
  String email;

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

  Widget _buildNoUser() {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        padding: EdgeInsets.only(top: 30, left: 5, right: 5),
        child: Card(
          child: Container(
            height: size.height * 0.18,
            padding: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Icon(
                        Icons.accessibility_new,
                        size: 50,
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black12,
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Please Login or Signup to continue!', textAlign: TextAlign.center,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingPage()));
                            },
                            color: Colors.lightBlue,
                            child: const Text('Login/Signup',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                        ),
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

  Widget _buildUser() {
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
                      child: Icon(
                        Icons.accessibility_new,
                        size: 50,
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black12,
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Column(
                      children: <Widget>[
                        Text('ada orangnya'),
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
      body: email == null ? _buildNoUser() : _buildUser()
    );
  }
}
