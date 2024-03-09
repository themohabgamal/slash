import 'dart:developer';

import 'package:dio/dio.dart';
import '../models/product.dart';

class HomeApi {
  final Dio _dio = Dio();

  Future<List<Product>> fetchAllProducts() async {
    const apiUrl = 'https://slash-backend.onrender.com/product';
    try {
      final response = await _dio.get(apiUrl);
      if (response.statusCode == 200) {
        // Assuming the list of products is directly under the 'data' key
        final List<dynamic> productsData = response.data['data'];

        // Map the dynamic list to a list of Product objects
        List<Product> products = productsData.map((data) {
          return Product.fromJson(data);
        }).toList();

        print(products.length);
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('adada: $error');
      throw Exception('Error: $error');
    }
  }
}
