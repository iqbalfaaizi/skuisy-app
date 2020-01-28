import 'package:flutter/material.dart';

class GlobalFunctions {
  Widget landingButtons(BuildContext context, String val, String tag){
    return Container(
      padding: tag == 'signup-page' ? EdgeInsets.fromLTRB(10, 0, 10, 20) : EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0),
        child: MaterialButton(
          minWidth: 100.0,
          height: MediaQuery.of(context).size.height * 0.07,
          elevation: 0,
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
                side: BorderSide(color: Colors.white, width: 2.5)
          ),
          color: tag == 'signup-page' ? Color(0xff800000) : Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed(tag);
          },
          child: Text(
            val, 
            style: TextStyle(
              color: tag == 'signup-page' ? Colors.white : Color(0xff800000),
              fontSize: 16,
              letterSpacing: 5.0,
              fontFamily: 'sans-serif-light'
            )
          ),
        ),
      ));
  }

  Widget authButtons(BuildContext context, String val, String tag, Function onButtonPressed){
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      // padding: tag == 'signup-page' ? EdgeInsets.fromLTRB(10, 0, 10, 20) : EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0),
        child: MaterialButton(
          minWidth: 100.0,
          height: MediaQuery.of(context).size.height * 0.06,
          elevation: 0,
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
                side: BorderSide(color: Colors.white, width: 2.5)
          ),
          color: tag == 'signup' ? Colors.white : Color(0xff800000),
          onPressed: onButtonPressed,
          child: Text(
            val, 
            style: TextStyle(
              color: tag == 'signup' ? Color(0xff800000) : Colors.white,
              fontSize: 16,
              letterSpacing: 2.0,
            )
          ),
        ),
      ));
  }

  alertDialog(BuildContext context, String msg) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
}