class Brand {
  int? id;
  String? brandType;
  String? brandName;
  String? brandFacebookPageLink;
  String? brandInstagramPageLink;
  String? brandLogoImagePath;
  // Add other nullable fields based on your JSON structure

  Brand({
    this.id,
    this.brandType,
    this.brandName,
    this.brandFacebookPageLink,
    this.brandInstagramPageLink,
    this.brandLogoImagePath,
    // Add other nullable fields based on your JSON structure
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      brandType: json['brand_type'],
      brandName: json['brand_name'],
      brandFacebookPageLink: json['brand_facebook_page_link'],
      brandInstagramPageLink: json['brand_instagram_page_link'],
      brandLogoImagePath: json['brand_logo_image_path'],
      // Add other nullable fields based on your JSON structure
    );
  }
}
