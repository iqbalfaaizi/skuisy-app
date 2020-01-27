import 'dart:async';
import 'package:skuisy_project/data/provider/navigation_provider.dart';
import 'package:rxdart/rxdart.dart';

class NavigationBloc {
  final navigationController = BehaviorSubject();
  NavigationProvider navigationProvider = new NavigationProvider();

  void updateEmail(String email) {
    navigationProvider.updateEmail(email);
    navigationController.sink.add(navigationProvider.currentEmail);
  }

  void dispose(){
    navigationController.close();
  }
}

final navBlocs = NavigationBloc();
