import 'package:skuisy_project/data/model/cart_model.dart';
import 'package:skuisy_project/data/provider/repository.dart';

class CartBloc {
  final _repository = Repository();

  dispose(){}

  Stream <List<Cart>> get cartList async* {
    yield await _repository.fetchCart();
  }
}

final cartBloc = CartBloc();