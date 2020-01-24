import 'package:flutter/material.dart';

class HomeActions extends StatefulWidget {
  @override
  _HomeActionsState createState() => _HomeActionsState();
}

class _HomeActionsState extends State<HomeActions> {

  Widget _buildAction(String tag) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.22,
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            gradient: LinearGradient(colors: [
              Colors.grey[350],
              Color(0xffffffff)
            ], begin: FractionalOffset.topLeft)
          ),
          child: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  tag == 'category' ? Icons.dashboard : 
                  tag == 'travel' ? Icons.flight : 
                  tag == 'pets' ? Icons.pets : 
                  tag == 'phone' ? Icons.phone_android : 
                  Icons.ac_unit,
                  size: 30,
                ),
              ),
              Text(
                'Category', 
                style: TextStyle(fontSize: 11),
              )
            ],
          )
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height * 0.09,
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
