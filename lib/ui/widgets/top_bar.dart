import 'package:flutter/material.dart';
import 'package:skuisy_project/ui/widgets/search.dart';

Widget topBar(BuildContext context) {
  return AppBar(
    backgroundColor: Color(0xff800000),
    title: Search(),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.notifications),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.shopping_basket),
        onPressed: () {},
      )
    ],
  );
}