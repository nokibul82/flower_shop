import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  String catId;
  String catName;
  String catImage;
  String vendorId;

  CategoryModel({
    required this.catId,
    required this.catName,
    required this.catImage,
    required this.vendorId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    catId: json["cat_id"],
    catName: json["cat_name"],
    catImage: json["cat_image"],
    vendorId: json["vendor_id"],
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId,
    "cat_name": catName,
    "cat_image": catImage,
    "vendor_id": vendorId,
  };
}
