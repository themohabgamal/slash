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

class Brand {
  int? id;
  String? brandType;
  String? brandName;
  String? brandFacebookPageLink;
  String? brandInstagramPageLink;
  // Add other nullable fields based on your JSON structure

  Brand({
    this.id,
    this.brandType,
    this.brandName,
    this.brandFacebookPageLink,
    this.brandInstagramPageLink,
    // Add other nullable fields based on your JSON structure
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      brandType: json['brand_type'],
      brandName: json['brand_name'],
      brandFacebookPageLink: json['brand_facebook_page_link'],
      brandInstagramPageLink: json['brand_instagram_page_link'],
      // Add other nullable fields based on your JSON structure
    );
  }
}

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

class ProductStatusLookup {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductStatusLookup({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductStatusLookup.fromJson(Map<String, dynamic> json) {
    return ProductStatusLookup(
      id: json['id'],
      name: json['name'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}

class ProductVarientImage {
  int? id;
  String? imagePath;
  int? productVarientId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductVarientImage({
    this.id,
    this.imagePath,
    this.productVarientId,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductVarientImage.fromJson(Map<String, dynamic> json) {
    return ProductVarientImage(
      id: json['id'],
      imagePath: json['image_path'],
      productVarientId: json['product_varient_id'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
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
