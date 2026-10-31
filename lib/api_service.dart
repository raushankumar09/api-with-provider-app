import 'dart:convert';

import 'package:api_with_provider/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) {
        return ProductModel.fromjson(e);
      }).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
