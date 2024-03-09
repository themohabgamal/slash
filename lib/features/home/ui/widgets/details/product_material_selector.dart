import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/theme/my_colors.dart';
import 'package:slash/core/theme/my_fonts.dart';
import 'package:slash/features/home/data/models/product_details.dart';

class ProductMaterialSelector extends StatefulWidget {
  final ProductDetails productDetails;
  const ProductMaterialSelector({super.key, required this.productDetails});

  @override
  _ProductMaterialSelectorState createState() =>
      _ProductMaterialSelectorState();
}

class _ProductMaterialSelectorState extends State<ProductMaterialSelector> {
  int selectedMaterialIndex = 0; // Index of the selected material
  List<String?> materials = []; // Replace with your actual materials

  getAvailableMaterials() {
    materials = widget.productDetails.data!.avaiableProperties!
        .where((property) => property.property == "Materials")
        .expand((property) => property.values!.map((value) => value.value))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getAvailableMaterials();
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
            "Select Material",
            style: MyFonts.font18WhiteBold,
          ),
          SizedBox(height: 10.h),
          materials.isEmpty
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    "No Materials For this Product",
                    style: MyFonts.font14WhiteBold,
                  ),
                )
              : SizedBox(
                  height: 50.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      materials.length,
                      (index) => buildMaterialContainer(index),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildMaterialContainer(int index) {
    bool isSelected = index == selectedMaterialIndex;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedMaterialIndex = index;
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
              materials[index]!,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
