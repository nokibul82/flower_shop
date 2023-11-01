import 'dart:convert';

List<ColorModel> colorModelFromJson(String str) => List<ColorModel>.from(json.decode(str).map((x) => ColorModel.fromJson(x)));

String colorModelToJson(List<ColorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ColorModel {
  String colorId;
  String colorName;
  String vendorId;

  ColorModel({
    required this.colorId,
    required this.colorName,
    required this.vendorId,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
    colorId: json["color_id"],
    colorName: json["color_name"],
    vendorId: json["vendor_id"],
  );

  Map<String, dynamic> toJson() => {
    "color_id": colorId,
    "color_name": colorName,
    "vendor_id": vendorId,
  };
}
