import 'package:skuisy_project/data/model/product_model.dart';
import 'package:skuisy_project/data/provider/repository.dart';

class ProductBloc {
  final _repository = Repository();

  dispose(){}

  Stream <List<Product>> get productListAll async* {
    yield await _repository.fetchAllProduct();
  }
}

final productBloc = ProductBloc();