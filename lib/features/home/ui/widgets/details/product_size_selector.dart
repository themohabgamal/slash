import 'package:flutter/material.dart';
import 'package:slash/core/theme/my_colors.dart';
import 'package:slash/core/theme/my_fonts.dart';
import 'package:slash/features/home/data/models/product_details.dart';

class ProductSizeSelector extends StatefulWidget {
  final ProductDetails productDetails;
  const ProductSizeSelector({super.key, required this.productDetails});

  @override
  _ProductSizeSelectorState createState() => _ProductSizeSelectorState();
}

class _ProductSizeSelectorState extends State<ProductSizeSelector> {
  int selectedSizeIndex = 0; // Index of the selected size
  List<String?> sizes = []; // Replace with your actual sizes
  getAvaiableSizes() {
    sizes = widget.productDetails.data!.avaiableProperties!
        .where((property) => property.property == "Size")
        .expand((property) => property.values!.map((value) => value.value))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getAvaiableSizes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: sizes.isEmpty
          ? Align(
              alignment: Alignment.center,
              child: Text(
                "This Product has only one Size",
                style: MyFonts.font14WhiteBold,
              ),
            )
          : SizedBox(
              height: 50.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  sizes.length,
                  (index) => buildSizeContainer(index),
                ),
              ),
            ),
    );
  }

  Widget buildSizeContainer(int index) {
    bool isSelected = index == selectedSizeIndex;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedSizeIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 50.0,
          decoration: BoxDecoration(
            color:
                isSelected ? MyColors.yellowGreenColor : Colors.grey.shade900,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: Text(
              sizes[index]!,
              style: MyFonts.font14WhiteBold
                  .copyWith(color: isSelected ? Colors.black : Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
