import 'package:flutter/material.dart';

class HomeActions extends StatefulWidget {
  @override
  _HomeActionsState createState() => _HomeActionsState();
}

class _HomeActionsState extends State<HomeActions> {
  Widget _buildAction(String tag) {
    return Column(
      children: <Widget>[
        _buildActionIcons(tag),
        SizedBox(height: 5),
        Container(
          width: 55,
          padding: EdgeInsets.symmetric(horizontal: 5),
          margin: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.topCenter,
          child: Text(
            tag == 'category' ? 'Category'
            : tag == 'travel' ? 'Travel'
            : tag == 'pets' ? 'Pets'
            : tag == 'phone' ? 'Mobile' : 'Unknown',
            style: TextStyle(fontSize: 11),
          )
        )
      ],
    );
  }

  Widget _buildActionIcons(String tag) {
    return Container(
      width: 50,
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 0.5),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 3,
          offset: Offset(3, 3),
        )]
      ),
      child: IconButton(
        onPressed: (){},
        icon: Icon(
          tag == 'category' ? Icons.dashboard
          : tag == 'travel' ? Icons.flight
          : tag == 'pets' ? Icons.pets
          : tag == 'phone' ? Icons.phone_android
          : Icons.ac_unit,
          size: 25,
          color: Color(0xff800000),
        ),
      ),
    );
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
