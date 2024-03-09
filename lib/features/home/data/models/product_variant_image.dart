class ProductVariantImage {
  final int id;
  final String imagePath;
  final int productVariantId;

  ProductVariantImage({
    required this.id,
    required this.imagePath,
    required this.productVariantId,
  });

  factory ProductVariantImage.fromJson(Map<String, dynamic> json) {
    return ProductVariantImage(
      id: json['id'],
      imagePath: json['imagePath'],
      productVariantId: json['productVariantId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'productVariantId': productVariantId,
    };
  }
}
