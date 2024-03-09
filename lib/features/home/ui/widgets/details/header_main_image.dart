import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/features/home/ui/screens/product_details_screen.dart';

class HeaderMainImage extends StatelessWidget {
  final String imagePath;
  const HeaderMainImage({
    super.key,
    required this.widget,
    required this.imagePath,
  });

  final ProductDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          color: Colors.white,
          child: Image.network(
            imagePath,
            height: 300.0.h,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
