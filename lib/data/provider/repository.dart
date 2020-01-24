import 'dart:async';
import 'package:skuisy_project/data/provider/product_api_provider.dart';

class Repository{
  final productApiProvider =ProductApiProvider();

  Future fetchAllProduct() => productApiProvider.fetchAllProduct();
}