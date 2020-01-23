import 'package:dio/dio.dart';

class ApiService {
  Dio dio = new Dio();

  Future getTest() async {
    final res = await dio.get('http://skuisy-app.herokuapp.com/');
    final resJson = res.data;
    return resJson;
  }

  Future signUp(String email, String password) async {
    final res = await dio.post('http://skuisy-app.herokuapp.com/api/v1/signup',
        data: {'email': email, 'password': password});
    final resJson = res.data;
    return resJson;
  }

  Future logIn(String email, String password) async {
    final res = await dio.post('http://skuisy-app.herokuapp.com/api/v1/login',
        data: {'email': email, 'password': password});
    final resJson = res.data;
    return resJson;
  }
}
