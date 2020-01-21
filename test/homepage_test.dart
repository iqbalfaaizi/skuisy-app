import 'package:skuisy_project/utils/api_service.dart';
import 'package:flutter_test/flutter_test.dart';

ApiService _apiService = new ApiService();

void main() {
  test('My API has ladies', () async {
    var value = await _apiService.getTest();
    expect(value, 'Hello ladies');
  });
}