import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/theme/my_fonts.dart';
import 'package:slash/features/home/data/models/product_details.dart';
import 'package:slash/features/home/ui/widgets/details/product_color_selector.dart';
import 'package:slash/features/home/ui/widgets/details/product_material_selector.dart';
import 'package:slash/features/home/ui/widgets/details/product_size_selector.dart';

class ProductAvailableProperties extends StatelessWidget {
  final ProductDetails productDetails;
  const ProductAvailableProperties({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Size",
                style: MyFonts.font18WhiteBold,
              ),
              Text(
                "Size Chart",
                style: MyFonts.font18WhiteBold,
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        ProductSizeSelector(
          productDetails: productDetails,
        ),
        SizedBox(
          height: 20.h,
        ),
        ProductMaterialSelector(
          productDetails: productDetails,
        ),
        SizedBox(
          height: 20.h,
        ),
        ProductColorSelector(productDetails: productDetails),
      ],
    );
  }
}
