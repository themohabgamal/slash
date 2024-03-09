import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/theme/my_fonts.dart';
import 'package:slash/features/home/data/models/product_details.dart';

class ProductColorSelector extends StatefulWidget {
  final ProductDetails productDetails;
  const ProductColorSelector({super.key, required this.productDetails});

  @override
  ProductColorSelectorState createState() => ProductColorSelectorState();
}

class ProductColorSelectorState extends State<ProductColorSelector> {
  int selectedColorIndex = 0; // Index of the selected color
  List<String?> colors = []; // Replace with your actual colors

  getAvailableColors() {
    colors = widget.productDetails.data!.avaiableProperties!
        .where((property) => property.property == "Color")
        .expand((property) => property.values!.map((value) => value.value))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getAvailableColors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Color",
            style: MyFonts.font18WhiteBold,
          ),
          SizedBox(height: 10.h),
          colors.isEmpty
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    "No Colors For this Product",
                    style: MyFonts.font14WhiteBold,
                  ),
                )
              : SizedBox(
                  height: 50.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      colors.length,
                      (index) => buildColorContainer(index),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildColorContainer(int index) {
    Color myColor =
        Color(0xFF + int.parse(colors[index]!.substring(1), radix: 16));

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedColorIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 50.0,
          decoration: BoxDecoration(
            color: myColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const SizedBox(),
        ),
      ),
    );
  }
}
