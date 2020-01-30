import 'package:flutter/material.dart';

class PictureDetail {
  _showMaterialPicture(BuildContext context) {
    Navigator.of(context).push(_buildMaterialPicture(context));
  }

  _buildMaterialPicture(BuildContext context) {
    return MaterialPageRoute<String>(
      settings: RouteSettings(name: 'picture_detail', isInitialRoute: false),
      builder: (BuildContext context) {
        return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage("https://picsum.photos/250?image=9"),
              ),
            ),
          ),
        );
      }
    );
  }
}