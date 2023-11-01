import 'dart:convert';

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

  Map<String, dynamic> toJson() => {
    "p_id": pId,
    "vendor_id": vendorId,
    "p_code": pCode,
    "p_name": pName,
    "p_w_price": pWPrice,
    "p_price": pPrice,
    "p_s_price": pSPrice,
    "p_p_off": pPOff,
    "p_measurement": pMeasurement,
    "p_availability": pAvailability,
    "p_short_description": pShortDescription,
    "p_description": pDescription,
    "cat_id": catId,
    "brand_id": brandId,
    "p_quantity": pQuantity,
    "p_image": pImage,
    "added": added,
    "modified": modified,
  };
}
