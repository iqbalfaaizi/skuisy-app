import 'package:flutter/material.dart';
import 'package:skuisy_project/ui/widgets/search.dart';

Widget topBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
    child: AppBar(
      backgroundColor: Color(0xff800000),
      title: Search(),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_basket),
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    )
  );
}