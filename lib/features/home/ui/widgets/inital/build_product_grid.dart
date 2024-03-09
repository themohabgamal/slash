import 'package:flutter/material.dart';
import 'package:slash/features/home/data/models/product.dart';
import 'package:slash/features/home/ui/screens/product_details_screen.dart';
import 'package:slash/features/home/ui/widgets/inital/build_product_card.dart';

Widget buildProductGrid(List<Product?> products) {
  return GridView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // You can adjust the number of columns as needed
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7),
    itemCount: products.length,
    itemBuilder: (context, index) {
      return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsScreen(product: products[index]!),
              )),
          child: buildProductCard(products[index]));
    },
  );
}
