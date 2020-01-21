import 'package:dio/dio.dart';

class ApiService {
  Dio dio = new Dio();

  Future getTest() async {
    final res = await dio.get('https://skuisy-app.herokuapp.com/');
    final resJson = res.data;
    return resJson;
  }
}