import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:skuisy_project/res/strings.dart';
import 'package:skuisy_project/data/model/product_model.dart';

class ProductApiProvider{
  Client client = Client();

  Future fetchAllProduct() async {
    http.Response response = await http.get("$base_url/getproduct");
    await Future.delayed(Duration(milliseconds: 500));
    String content = response.body;
    final allProduct = productFromJson(content);
    return allProduct;
  }
  
}