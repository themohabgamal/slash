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
