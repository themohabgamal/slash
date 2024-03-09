import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/theme/my_colors.dart';
import 'package:slash/core/theme/my_fonts.dart';
import 'package:slash/features/home/data/models/product.dart';

Widget buildProductCard(Product? product) {
  // Customize the card design based on your needs
  return Card(
    color: MyColors.blackColor,
    elevation: 2.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Image.network(
              // Assuming your Product class has an imageUrl attribute
              product!
                  .productVariations![0].productVarientImages![0].imagePath!,
              height: 150.0,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 11),
          child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              product.name.toString(),
              style: MyFonts.font18WhiteBold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                'EGP ${product.productVariations![0].price}',
                style: MyFonts.font18WhiteBold,
              ),
              const Spacer(),
              const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              SizedBox(
                width: 2.w,
              ),
              const Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
