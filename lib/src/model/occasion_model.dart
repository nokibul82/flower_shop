import 'dart:convert';

List<OccasionModel> occasionModelFromJson(String str) => List<OccasionModel>.from(json.decode(str).map((x) => OccasionModel.fromJson(x)));

String occasionModelToJson(List<OccasionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OccasionModel {
  String occasionsId;
  String occasionsName;
  String occasionsImage;
  String vendorId;

  OccasionModel({
    required this.occasionsId,
    required this.occasionsName,
    required this.occasionsImage,
    required this.vendorId,
  });

  factory OccasionModel.fromJson(Map<String, dynamic> json) => OccasionModel(
    occasionsId: json["occasions_id"],
    occasionsName: json["occasions_name"],
    occasionsImage: json["occasions_image"],
    vendorId: json["vendor_id"],
  );

  get isSelected => false;

  Map<String, dynamic> toJson() => {
    "occasions_id": occasionsId,
    "occasions_name": occasionsName,
    "occasions_image": occasionsImage,
    "vendor_id": vendorId,
  };
}