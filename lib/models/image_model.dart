import 'package:json_annotation/json_annotation.dart';

part "image_model.g.dart";

@JsonSerializable()
class ImageModel {
  String id;
  String filename;
  String title;

  @JsonKey(name: "url_small_size")
  String urlSmallSize;

  @JsonKey(name: "url_full_size")
  String urlFullSize;

  ImageModel({
    required this.id,
    required this.filename,
    required this.title,
    required this.urlSmallSize,
    required this.urlFullSize,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
