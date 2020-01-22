import 'package:dio/dio.dart';

class ApiService {
  Dio dio = new Dio();

  Future getTest() async {
    final res = await dio.get('http://skuisy-app.herokuapp.com/');
    final resJson = res.data;
    return resJson;
  }
}