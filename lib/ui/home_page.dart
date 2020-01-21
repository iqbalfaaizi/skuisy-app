import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:skuisy_project/utils/api_service.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dataStr = '';
  ApiService _apiService = new ApiService();

  @override
  void initState() {
    this._getApi();
    super.initState();
  }

  void _getApi() async {
    final resData = await _apiService.getTest();
    setState(() {
      dataStr = resData.toString();
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeyeye"),
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