import 'package:flutter/material.dart';
import 'package:slash/core/theme/my_fonts.dart';

class ProductDetailsErrorBuilder extends StatelessWidget {
  const ProductDetailsErrorBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/sorry.png',
            width: 200,
          ),
          Text(
            'Sorry, No Data Found for this Product \n Try Again with our other Products',
            textAlign: TextAlign.center,
            style: MyFonts.font18WhiteBold,
          ),
        ],
      ),
    );
  }
}
