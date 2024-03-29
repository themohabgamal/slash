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
