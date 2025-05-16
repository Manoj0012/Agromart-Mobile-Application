class Productmodel {
  final String cropName;
  final String cropType;
  final String availability;
  final String pricePerKG;
  final String description;
  Productmodel(
      {required this.cropName,
      required this.cropType,
      required this.availability,
      required this.pricePerKG,
      required this.description});

  Map<String, dynamic> toJson() {
    return {
      'cropName': cropName,
      'cropType': cropType,
      'availability': availability,
      'pricePerKG': pricePerKG,
      'description': description,
    };
  }
}
