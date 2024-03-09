import 'package:flutter/material.dart';
import 'package:slash/core/theme/my_fonts.dart';
import 'package:slash/features/home/data/api/home_api.dart';
import 'package:slash/features/home/data/models/product.dart';
import 'package:slash/features/home/data/models/product_details.dart';
import 'package:slash/features/home/ui/widgets/details/brand_logo.dart';
import 'package:slash/features/home/ui/widgets/details/description.dart';
import 'package:slash/features/home/ui/widgets/details/header_main_image.dart';
import 'package:slash/features/home/ui/widgets/details/product_available_properties.dart';
import 'package:slash/features/home/ui/widgets/details/product_details_error_builder.dart';
import 'package:slash/features/home/ui/widgets/details/product_details_loading_builder.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product? product;
  const ProductDetailsScreen({super.key, this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<String> variantImages = [];
  int selectedIndex = 0;
  fillVariantImages() {
    for (var element
        in widget.product!.productVariations![0].productVarientImages!) {
      variantImages.add(element.imagePath!);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fillVariantImages();
    });
  }

  List<Widget> getVariantImages(List<String> variantImages) {
    return variantImages.map((imageUrl) {
      return buildVariantImage(imageUrl, variantImages);
    }).toList();
  }

  Widget buildVariantImage(String imageUrl, List<String> variantImages) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = variantImages.indexOf(imageUrl);
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            imageUrl,
            height: 50.0,
            width: 50.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: MyFonts.font20White.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<ProductDetails>(
          future: HomeApi().getProductDetails(widget.product!.id!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const ProductDetailsErrorBuilder();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ProductDetailsLoadingBuilder();
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Image with Variants
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Rounded Corners Network Image
                        HeaderMainImage(
                          widget: widget,
                          imagePath: variantImages[selectedIndex],
                        ),
                        const SizedBox(height: 16.0),
                        // Small Rounded Variant Images
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: getVariantImages(variantImages),
                        ),
                      ],
                    ),
                  ),

                  // Product Name and Brand
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data!.data!.name ?? "",
                          style: MyFonts.font22WhiteBold,
                        ),
                        brandLogo(widget: widget)
                      ],
                    ),
                  ),

                  // Price and Brand Name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EGP ${widget.product!.productVariations![0].price.toString()}",
                          style: MyFonts.font22WhiteBold,
                        ),
                        Text(widget.product!.brand!.brandName!),
                      ],
                    ),
                  ),
                  // Expandable Description
                  Description(text: widget.product!.description.toString()),
                  ProductAvailableProperties(productDetails: snapshot.data!),
                ],
              ),
            );
          }),
    );
  }
}
