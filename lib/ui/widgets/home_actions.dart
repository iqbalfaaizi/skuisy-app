import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class HomeActions extends StatefulWidget {
  @override
  _HomeActionsState createState() => _HomeActionsState();
}

class _HomeActionsState extends State<HomeActions> {
  Widget _buildAction(String tag) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
            : tag == 'phone' ? 'Mobile'
            : tag == 'drugs' ? 'Drugs' 
            : tag == 'finance' ? 'Finance'
            : 'Unknown',
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
      child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(3),
        child: Image(
          image: AssetImage(
            tag == 'category' ? 'assets/images/icons/category.png' :
            tag == 'travel' ? 'assets/images/icons/plane.png' :
            tag == 'pets' ? 'assets/images/icons/paw.png' :
            tag == 'phone' ? 'assets/images/icons/internet.png' :
            tag == 'drugs' ? 'assets/images/icons/drug.png' :
            tag == 'finance' ? 'assets/images/icons/money.png' :
            'assets/images/icons/plane.png'
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.grey[200],
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(0,3)
        )]
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildAction('category'),
          _buildAction('travel'),
          _buildAction('pets'),
          _buildAction('phone'),
          _buildAction('drugs'),
          _buildAction('finance'),
        ],
      ),
    );
  }
}
