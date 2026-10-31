import 'package:api_with_provider/api_service.dart';
import 'package:api_with_provider/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> products = [];

  bool isLoading = false;

  String errorMessage = '';

  Future<void> featchProducts() async {
    isLoading = true;
    errorMessage = '';

    notifyListeners();

    try {
      products = await ApiService().getProducts();
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;

    notifyListeners();
  }
}
