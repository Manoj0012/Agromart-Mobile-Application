class CropProduct {
  final String id; // MongoDB ObjectId as string
  final String owner; // owner ObjectId as string
  final String cropName;
  final String cropType;
  final String cropColor;
  final String cropCategories;
  final String availability;
  final String pricePerKG;
  final String location;
  final String description;

  CropProduct({
    required this.id,
    required this.owner,
    required this.cropName,
    required this.cropType,
    required this.cropColor,
    required this.cropCategories,
    required this.availability,
    required this.pricePerKG,
    required this.location,
    required this.description,
  });
  factory CropProduct.fromJson(Map<String, dynamic> json) {
    return CropProduct(
      id: json['_id'],
      owner: json['owner'],
      cropName: json['Cropname'],
      cropType: json['CropType'],
      cropColor: json['CropColor'],
      cropCategories: json['CropCategories'],
      availability: json['Avalibilty'],
      pricePerKG: json['PricePerKG'],
      location: json['Location'],
      description: json['Description'],
    );
  }
}
