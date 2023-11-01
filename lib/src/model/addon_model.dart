import 'dart:convert';

List<AddonModel> addonModelFromJson(String str) => List<AddonModel>.from(json.decode(str).map((x) => AddonModel.fromJson(x)));

String addonModelToJson(List<AddonModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddonModel {
  String addonsId;
  String addonsName;
  String addonsImage;
  String vendorId;

  AddonModel({
    required this.addonsId,
    required this.addonsName,
    required this.addonsImage,
    required this.vendorId,
  });

  factory AddonModel.fromJson(Map<String, dynamic> json) => AddonModel(
    addonsId: json["addons_id"],
    addonsName: json["addons_name"],
    addonsImage: json["addons_image"],
    vendorId: json["vendor_id"],
  );

  Map<String, dynamic> toJson() => {
    "addons_id": addonsId,
    "addons_name": addonsName,
    "addons_image": addonsImage,
    "vendor_id": vendorId,
  };
}