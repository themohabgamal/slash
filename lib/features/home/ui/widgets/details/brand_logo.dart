import 'package:flutter/material.dart';
import 'package:slash/features/home/ui/screens/product_details_screen.dart';

class brandLogo extends StatelessWidget {
  const brandLogo({
    super.key,
    required this.widget,
  });

  final ProductDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.network(
        widget.product!.brand!.brandLogoImagePath!,
        width: 50,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          // In case of failure  or no image on the path
          return const SizedBox();
        },
      ),
    );
  }
}
