import 'dart:convert';

import 'package:one_click_flowers/src/model/product_size_type.dart';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  String pId;
  String vendorId;
  String pCode;
  String pName;
  String pWPrice;
  String pPrice;
  String pSPrice;
  String pPOff;
  String pMeasurement;
  String pAvailability;
  String pShortDescription;
  String pDescription;
  String catId;
  String brandId;
  String pQuantity;
  String pImage;
  String added;
  String modified;

  ProductModel({
    required this.pId,
    required this.vendorId,
    required this.pCode,
    required this.pName,
    required this.pWPrice,
    required this.pPrice,
    required this.pSPrice,
    required this.pPOff,
    required this.pMeasurement,
    required this.pAvailability,
    required this.pShortDescription,
    required this.pDescription,
    required this.catId,
    required this.brandId,
    required this.pQuantity,
    required this.pImage,
    required this.added,
    required this.modified,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    pId: json["p_id"],
    vendorId: json["vendor_id"],
    pCode: json["p_code"],
    pName: json["p_name"],
    pWPrice: json["p_w_price"],
    pPrice: json["p_price"],
    pSPrice: json["p_s_price"],
    pPOff: json["p_p_off"],
    pMeasurement: json["p_measurement"],
    pAvailability: json["p_availability"],
    pShortDescription: json["p_short_description"],
    pDescription: json["p_description"],
    catId: json["cat_id"],
    brandId: json["brand_id"],
    pQuantity: json["p_quantity"],
    pImage: json["p_image"],
    added: json["added"],
    modified: json["modified"],
  );

  get isFavorite => true;

  ProductSizeType? get sizes => null;

  Map<String, dynamic> toJson(ProductModel productModel) => {
    "p_id": productModel.pId,
    "vendor_id": productModel.vendorId,
    "p_code": productModel.pCode,
    "p_name": productModel.pName,
    "p_w_price": productModel.pWPrice,
    "p_price": productModel.pPrice,
    "p_s_price": productModel.pSPrice,
    "p_p_off": productModel.pPOff,
    "p_measurement": productModel.pMeasurement,
    "p_availability": productModel.pAvailability,
    "p_short_description": productModel.pShortDescription,
    "p_description": productModel.pDescription,
    "cat_id": productModel.catId,
    "brand_id": productModel.brandId,
    "p_quantity": productModel.pQuantity,
    "p_image": productModel.pImage,
    "added": productModel.added,
    "modified": productModel.modified,
  };
}
