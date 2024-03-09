import 'package:flutter/material.dart';
import 'package:slash/core/theme/my_fonts.dart';
import 'package:slash/features/home/data/api/home_api.dart';
import 'package:slash/features/home/ui/widgets/inital/app_bar.dart';
import 'package:slash/features/home/ui/widgets/inital/build_product_grid.dart';
import 'package:slash/features/home/ui/widgets/inital/fetching_products_loading.dart';

import '../../data/models/product.dart';

class InitialScreen extends StatelessWidget {
  final HomeApi homeApi = HomeApi();
  InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: FutureBuilder<List<Product?>>(
        future: homeApi.fetchAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return const FetchingProductsLoading();
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
}
