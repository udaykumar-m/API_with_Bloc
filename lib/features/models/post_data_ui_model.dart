import 'dart:convert';

List<PostDataUiModel> postDataUiModelFromJson(String str) =>
    List<PostDataUiModel>.from(
        json.decode(str).map((x) => PostDataUiModel.fromJson(x)));

String postDataUiModelToJson(List<PostDataUiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostDataUiModel {
  int userId;
  int id;
  String title;
  String body;

  PostDataUiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDataUiModel.fromJson(Map<String, dynamic> json) =>
      PostDataUiModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
