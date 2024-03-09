import 'package:slash/features/home/data/models/product_variant_image.dart';

class ProductVariation {
  final int id;
  final int productId;
  final double price;
  final int quantity;
  final bool isDefault;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int productVariationStatusId;
  final String? acceptedBy;
  final List<ProductVariantImage> productVarientImages;

  ProductVariation({
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.isDefault,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.productVariationStatusId,
    this.acceptedBy,
    required this.productVarientImages,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) {
    return ProductVariation(
      id: json['id'],
      productId: json['product_id'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      isDefault: json['is_default'],
      deletedAt:
          json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      productVariationStatusId: json['product_variation_status_id'],
      acceptedBy: json['accepted_by'],
      productVarientImages: (json['ProductVarientImages'] as List<dynamic>)
          .map((v) => ProductVariantImage.fromJson(v))
          .toList(),
    );
  }
}
