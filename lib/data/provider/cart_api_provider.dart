import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:skuisy_project/data/bloc/navigation_bloc.dart';
import 'package:skuisy_project/data/model/cart_model.dart';
import 'package:skuisy_project/data/model/product_model.dart';
import 'package:skuisy_project/res/strings.dart';
import 'package:skuisy_project/utils/utils.dart';

class CartApiProvider{
  Client client = Client();
  Prefs _prefs = new Prefs();

  Future fetchCart() async {
    // String email = navBlocs.navigationProvider.currentEmail;
    final email = await _prefs.getEmail();
    // print('f$email');
    http.Response response =  await http.get("$base_url/getcart/$email");
    await Future.delayed(Duration(milliseconds: 500));
    String content = response.body;
    final cart = cartFromJson(content);
    return cart;
  }
}