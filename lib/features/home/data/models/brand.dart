class Brand {
  final int id;
  final String brandType;
  final String brandName;
  final String brandFacebookPageLink;
  final String brandInstagramPageLink;
  final String? brandWebsiteLink;
  final String brandMobileNumber;
  final String brandEmailAddress;
  final String? taxIdNumber;
  final String brandDescription;
  final String brandLogoImagePath;

  Brand({
    required this.id,
    required this.brandType,
    required this.brandName,
    required this.brandFacebookPageLink,
    required this.brandInstagramPageLink,
    required this.brandWebsiteLink,
    required this.brandMobileNumber,
    required this.brandEmailAddress,
    required this.taxIdNumber,
    required this.brandDescription,
    required this.brandLogoImagePath,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      brandType: json['brandType'],
      brandName: json['brandName'],
      brandFacebookPageLink: json['brandFacebookPageLink'],
      brandInstagramPageLink: json['brandInstagramPageLink'],
      brandWebsiteLink: json['brandWebsiteLink'],
      brandMobileNumber: json['brandMobileNumber'],
      brandEmailAddress: json['brandEmailAddress'],
      taxIdNumber: json['taxIdNumber'],
      brandDescription: json['brandDescription'],
      brandLogoImagePath: json['brandLogoImagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brandType': brandType,
      'brandName': brandName,
      'brandFacebookPageLink': brandFacebookPageLink,
      'brandInstagramPageLink': brandInstagramPageLink,
      'brandWebsiteLink': brandWebsiteLink,
      'brandMobileNumber': brandMobileNumber,
      'brandEmailAddress': brandEmailAddress,
      'taxIdNumber': taxIdNumber,
      'brandDescription': brandDescription,
      'brandLogoImagePath': brandLogoImagePath,
    };
  }
}
