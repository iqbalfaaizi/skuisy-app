import 'dart:async';
import 'package:skuisy_project/data/provider/cart_api_provider.dart';
import 'package:skuisy_project/data/provider/product_api_provider.dart';

class Repository{
  final productApiProvider =ProductApiProvider();
  final cartApiProvider =CartApiProvider();

  Future fetchAllProduct() => productApiProvider.fetchAllProduct();
  Future fetchCart() => cartApiProvider.fetchCart();
}