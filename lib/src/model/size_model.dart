import 'dart:convert';

List<SizeModel> sizeModelFromJson(String str) => List<SizeModel>.from(json.decode(str).map((x) => SizeModel.fromJson(x)));

String sizeModelToJson(List<SizeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SizeModel {
  String sizeId;
  String size;
  String vendorId;

  SizeModel({
    required this.sizeId,
    required this.size,
    required this.vendorId,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) => SizeModel(
    sizeId: json["size_id"],
    size: json["size"],
    vendorId: json["vendor_id"],
  );

  Map<String, dynamic> toJson() => {
    "size_id": sizeId,
    "size": size,
    "vendor_id": vendorId,
  };
}
