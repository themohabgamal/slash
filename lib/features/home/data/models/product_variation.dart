import 'package:slash/features/home/data/models/product_status_lookup.dart';
import 'package:slash/features/home/data/models/product_variant_image.dart';

class ProductVariation {
  int? id;
  int? productId;
  double? price;
  int? quantity;
  bool? isDefault;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  ProductStatusLookup? productStatusLookup;
  List<ProductVarientImage>? productVarientImages;

  ProductVariation({
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.isDefault,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.productStatusLookup,
    this.productVarientImages,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) {
    try {
      return ProductVariation(
        id: json['id'],
        productId: json['product_id'],
        price: (json['price'] ?? 0).toDouble(),
        quantity: json['quantity'],
        isDefault: json['is_default'],
        deletedAt: json['deletedAt'] != null
            ? DateTime.parse(json['deletedAt'])
            : null,
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        productStatusLookup: json['ProductStatusLookups'] != null
            ? ProductStatusLookup.fromJson(json['ProductStatusLookups'])
            : null,
        productVarientImages: (json['ProductVarientImages'] as List<dynamic>?)
            ?.map((image) => ProductVarientImage.fromJson(image))
            .toList(),
      );
    } catch (e) {
      print("productVariation : $e");
      rethrow;
    }
  }
}
