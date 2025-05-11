// To parse this JSON data, do
//
//     final animationMoviesModel = animationMoviesModelFromJson(jsonString);

import 'dart:convert';

List<AnimationMoviesModel> animationMoviesModelFromJson(String str) =>
    List<AnimationMoviesModel>.from(
        json.decode(str).map((x) => AnimationMoviesModel.fromJson(x)));

String animationMoviesModelToJson(List<AnimationMoviesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimationMoviesModel {
  int id;
  String title;
  String posterUrl;
  String imdbId;

  AnimationMoviesModel({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.imdbId,
  });

  factory AnimationMoviesModel.fromJson(Map<String, dynamic> json) =>
      AnimationMoviesModel(
        id: json["id"],
        title: json["title"],
        posterUrl: json["posterURL"],
        imdbId: json["imdbId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "posterURL": posterUrl,
        "imdbId": imdbId,
      };
}
