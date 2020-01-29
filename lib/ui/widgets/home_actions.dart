import 'package:flutter/material.dart';

class HomeActions extends StatefulWidget {
  @override
  _HomeActionsState createState() => _HomeActionsState();
}

class _HomeActionsState extends State<HomeActions> {
  Widget _buildAction(String tag) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.22,
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.transparent,
        child: Container(
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                gradient: LinearGradient(
                    colors: [Colors.red[100], Colors.yellow[50]],
                    begin: FractionalOffset.topLeft)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  // onPressed,
                  icon: Icon(
                    tag == 'category'
                        ? Icons.dashboard
                        : tag == 'travel'
                            ? Icons.flight
                            : tag == 'pets'
                                ? Icons.pets
                                : tag == 'phone'
                                    ? Icons.phone_android
                                    : Icons.ac_unit,
                    size: 25,
                  ),
                ),
                Text(
                  tag == 'category'
                      ? 'Category'
                      : tag == 'travel'
                          ? 'Travel'
                          : tag == 'pets'
                              ? 'Pets'
                              : tag == 'phone' ? 'Mobile' : 'Unknown',
                  style: TextStyle(fontSize: 10),
                )
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.11,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildAction('category'),
          _buildAction('travel'),
          _buildAction('pets'),
          _buildAction('phone'),
          _buildAction('phone'),
          _buildAction('phone'),
        ],
      ),
    );
  }
}
