import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
  String banId;
  String banTitle;
  String banSubTitle;
  String banDescription;
  String banButtonUrl;
  String banImages;

  BannerModel({
    required this.banId,
    required this.banTitle,
    required this.banSubTitle,
    required this.banDescription,
    required this.banButtonUrl,
    required this.banImages,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    banId: json["ban_id"],
    banTitle: json["ban_title"],
    banSubTitle: json["ban_sub_title"],
    banDescription: json["ban_description"],
    banButtonUrl: json["ban_button_url"],
    banImages: json["ban_images"],
  );

  Map<String, dynamic> toJson() => {
    "ban_id": banId,
    "ban_title": banTitle,
    "ban_sub_title": banSubTitle,
    "ban_description": banDescription,
    "ban_button_url": banButtonUrl,
    "ban_images": banImages,
  };
}