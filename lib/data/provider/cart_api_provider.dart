import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:skuisy_project/data/model/cart_model.dart';
import 'package:skuisy_project/res/strings.dart';
import 'package:skuisy_project/utils/utils.dart';

class CartApiProvider {
  Client client = Client();
  Prefs _prefs = new Prefs();

  Future fetchCart() async {
    final email = await _prefs.getEmail();
    http.Response response = await http.get("$base_url/getcart/$email");
    await Future.delayed(Duration(milliseconds: 500));
    String content = response.body;
    final cart = cartFromJson(content);
    return cart;
  }

  Future addCart(title, description, stock, price, seller) async {
    final stock0 = stock?.toString();
    final price0 = price?.toString();
    final email = await _prefs.getEmail();
    // print(price0);
    print(email);
    await client.put("$base_url/addcart/$email", body: {
      "title": title,
      "description": description,
      "stock": stock0,
      "price": price0,
      "seller": seller
    });

  }
}
