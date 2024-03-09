import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:slash/features/home/data/models/product_details.dart';
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
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<ProductDetails> getProductDetails(int id) async {
    try {
      final response =
          await _dio.get('https://slash-backend.onrender.com/product/$id');

      if (response.statusCode == 200) {
        // Successful response, return the data
        var productDetails = ProductDetails.fromJson(response.data);
        return productDetails;
      } else {
        // Handle other status codes as needed
        throw Exception('Failed to load product details');
      }
    } catch (error) {
      // Handle Dio errors
      throw Exception('Failed to load product details: $error');
    }
  }
}
