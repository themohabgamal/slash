import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:slash/core/theme/my_fonts.dart';

class ProductDetailsLoadingBuilder extends StatelessWidget {
  const ProductDetailsLoadingBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SpinKitDancingSquare(
          size: 50,
          color: Colors.white,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text("Fetching Product Details...", style: MyFonts.font18WhiteBold),
      ],
    ));
  }
}
