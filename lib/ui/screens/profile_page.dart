import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Color(0xff800000),
                size: 200,
              ),
              onPressed: () {},
            ),
            Text(
              'Log In',
              style: TextStyle(
                  color: Color(0xff800000),
                  fontSize: 40,
                  fontFamily: 'LemonMilk'),
            ),
          ],
        ),
      ),
    );
  }
}
