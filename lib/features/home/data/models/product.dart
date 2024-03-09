import 'package:slash/features/home/data/models/brand.dart';
import 'package:slash/features/home/data/models/product_variation.dart';

class Product {
  int? id;
  String? name;
  String? type;
  String? description;
  int? subCategoryId;
  int? brandId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  double? productRating;
  int? estimatedDaysPreparing;
  Brand? brand;
  List<ProductVariation>? productVariations;
  SubCategory? subCategory;
  int? notApprovedVariants;

  Product({
    this.id,
    this.name,
    this.type,
    this.description,
    this.subCategoryId,
    this.brandId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.productRating,
    this.estimatedDaysPreparing,
    this.brand,
    this.productVariations,
    this.subCategory,
    this.notApprovedVariants,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    try {
      return Product(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        description: json['description'],
        subCategoryId: json['sub_category_id'],
        brandId: json['brand_id'],
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        deletedAt: json['deletedAt'] != null
            ? DateTime.parse(json['deletedAt'])
            : null,
        productRating: json['product_rating']?.toDouble(),
        estimatedDaysPreparing: json['estimated_days_preparing'],
        brand: json['Brands'] != null ? Brand.fromJson(json['Brands']) : null,
        productVariations: (json['ProductVariations'] as List<dynamic>?)
            ?.map((variation) => ProductVariation.fromJson(variation))
            .toList(),
        subCategory: json['SubCategories'] != null
            ? SubCategory.fromJson(json['SubCategories'])
            : null,
        notApprovedVariants: json['notApprovedVariants'],
      );
    } catch (e) {
      print("product : $e");
      rethrow;
    }
  }
}

class SubCategory {
  int? id;
  String? name;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? categoryId;
  String? imagePath;

  SubCategory({
    this.id,
    this.name,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.imagePath,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
      deletedAt:
          json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      categoryId: json['category_id'],
      imagePath: json['image_path'],
    );
  }
}
