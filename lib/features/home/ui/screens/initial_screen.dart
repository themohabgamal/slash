import 'package:flutter/material.dart';
import 'package:slash/core/theme/my_fonts.dart';
import 'package:slash/features/home/data/api/home_api.dart';

import '../../data/models/product.dart';

class InitialScreen extends StatelessWidget {
  final HomeApi homeApi = HomeApi();
  InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Slash.',
          style: MyFonts.font28WhiteBold,
        ),
      ),
      body: FutureBuilder<List<Product?>>(
        future: homeApi.fetchAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error, display an error message
            return Center(child: Text('wa: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // If there's no data or the data is empty, show an empty message
            return const Center(child: Text('No products available.'));
          } else {
            // If data is available, build the GridView
            return buildProductGrid(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget buildProductGrid(List<Product?> products) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // You can adjust the number of columns as needed
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return buildProductCard(products[index]);
      },
    );
  }

  Widget buildProductCard(Product? product) {
    // Customize the card design based on your needs
    return const Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.network(
          //   // Assuming your Product class has an imageUrl attribute
          //   product!
          //       .productVariations.first.productVarientImages.first.imagePath,
          //   height: 120.0,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              " product.name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              // Add other product details as needed
              'Price: \$}',
            ),
          ),
        ],
      ),
    );
  }
}
