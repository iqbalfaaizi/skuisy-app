import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dataStr = '';

  @override
  void initState() {
    this._getApi();
    super.initState();
  }

  void _getApi() async {
    Dio dio = new Dio();
    final res = await dio.get('https://skuisy-app.herokuapp.com/');
    final resJson = res.data;
    // print();
    setState(() {
      dataStr = resJson.toString();
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(dataStr),
        ),
      ),
    );
  }
}