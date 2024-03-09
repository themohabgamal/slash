class ProductDetails {
  Data? data;
  String? message;
  int? statusCode;

  ProductDetails({this.data, this.message, this.statusCode});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['statusCode'] = statusCode;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? type;
  String? description;
  int? brandId;
  Null bostaSizeId;
  int? productRating;
  int? estimatedDaysPreparing;
  Count? cCount;
  Null sizeChart;
  SubCategory? subCategory;
  List<Variations>? variations;
  List<AvaiableProperties>? avaiableProperties;
  String? brandName;
  String? brandImage;

  Data(
      {this.id,
      this.name,
      this.type,
      this.description,
      this.brandId,
      this.bostaSizeId,
      this.productRating,
      this.estimatedDaysPreparing,
      this.cCount,
      this.sizeChart,
      this.subCategory,
      this.variations,
      this.avaiableProperties,
      this.brandName,
      this.brandImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
    brandId = json['brand_id'];
    bostaSizeId = json['bosta_size_id'];
    productRating = json['product_rating'];
    estimatedDaysPreparing = json['estimated_days_preparing'];
    cCount = json['_count'] != null ? Count.fromJson(json['_count']) : null;
    sizeChart = json['SizeChart'];
    subCategory = json['subCategory'] != null
        ? SubCategory.fromJson(json['subCategory'])
        : null;
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(Variations.fromJson(v));
      });
    }
    if (json['avaiableProperties'] != null) {
      avaiableProperties = <AvaiableProperties>[];
      json['avaiableProperties'].forEach((v) {
        avaiableProperties!.add(AvaiableProperties.fromJson(v));
      });
    }
    brandName = json['brandName'];
    brandImage = json['brandImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['description'] = description;
    data['brand_id'] = brandId;
    data['bosta_size_id'] = bostaSizeId;
    data['product_rating'] = productRating;
    data['estimated_days_preparing'] = estimatedDaysPreparing;
    if (cCount != null) {
      data['_count'] = cCount!.toJson();
    }
    data['SizeChart'] = sizeChart;
    if (subCategory != null) {
      data['subCategory'] = subCategory!.toJson();
    }
    if (variations != null) {
      data['variations'] = variations!.map((v) => v.toJson()).toList();
    }
    if (avaiableProperties != null) {
      data['avaiableProperties'] =
          avaiableProperties!.map((v) => v.toJson()).toList();
    }
    data['brandName'] = brandName;
    data['brandImage'] = brandImage;
    return data;
  }
}

class Count {
  int? productVariations;

  Count({this.productVariations});

  Count.fromJson(Map<String, dynamic> json) {
    productVariations = json['ProductVariations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProductVariations'] = productVariations;
    return data;
  }
}

class SubCategory {
  int? id;
  String? name;

  SubCategory({this.id, this.name});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Variations {
  int? id;
  int? price;
  int? quantity;
  bool? inStock;
  List<ProductVarientImages>? productVarientImages;
  List<ProductPropertiesValues>? productPropertiesValues;
  String? productStatus;
  bool? isDefault;
  int? productVariationStatusId;

  Variations(
      {this.id,
      this.price,
      this.quantity,
      this.inStock,
      this.productVarientImages,
      this.productPropertiesValues,
      this.productStatus,
      this.isDefault,
      this.productVariationStatusId});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    inStock = json['inStock'];
    if (json['ProductVarientImages'] != null) {
      productVarientImages = <ProductVarientImages>[];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages!.add(ProductVarientImages.fromJson(v));
      });
    }
    if (json['productPropertiesValues'] != null) {
      productPropertiesValues = <ProductPropertiesValues>[];
      json['productPropertiesValues'].forEach((v) {
        productPropertiesValues!.add(ProductPropertiesValues.fromJson(v));
      });
    }
    productStatus = json['productStatus'];
    isDefault = json['isDefault'];
    productVariationStatusId = json['product_variation_status_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['quantity'] = quantity;
    data['inStock'] = inStock;
    if (productVarientImages != null) {
      data['ProductVarientImages'] =
          productVarientImages!.map((v) => v.toJson()).toList();
    }
    if (productPropertiesValues != null) {
      data['productPropertiesValues'] =
          productPropertiesValues!.map((v) => v.toJson()).toList();
    }
    data['productStatus'] = productStatus;
    data['isDefault'] = isDefault;
    data['product_variation_status_id'] = productVariationStatusId;
    return data;
  }
}

class ProductVarientImages {
  int? id;
  String? imagePath;
  int? productVarientId;
  String? createdAt;
  String? updatedAt;

  ProductVarientImages(
      {this.id,
      this.imagePath,
      this.productVarientId,
      this.createdAt,
      this.updatedAt});

  ProductVarientImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
    productVarientId = json['product_varient_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_path'] = imagePath;
    data['product_varient_id'] = productVarientId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class ProductPropertiesValues {
  String? value;
  String? property;

  ProductPropertiesValues({this.value, this.property});

  ProductPropertiesValues.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    property = json['property'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['property'] = property;
    return data;
  }
}

class AvaiableProperties {
  String? property;
  List<Values>? values;

  AvaiableProperties({this.property, this.values});

  AvaiableProperties.fromJson(Map<String, dynamic> json) {
    property = json['property'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['property'] = property;
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  String? value;
  int? id;

  Values({this.value, this.id});

  Values.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['id'] = id;
    return data;
  }
}
