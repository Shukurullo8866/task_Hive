class ImageFields {
  static String albumId = "albumId";
  static String id = "id";
  static String title = "title";
  static String url = "url";
  static String thumbnailUrl = "thumbnailUrl";
}

class ImageModel {
  int? albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  ImageModel({
    this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        albumId: json["albumId"] ?? -1,
        id: json["id"] ?? -1,
        title: json["title"] ?? "",
        url: json["url"] ?? "",
        thumbnailUrl: json["thumbnailUrl"] ?? "",
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['albumId'] = albumId;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;

    return data;
  }

  ImageModel copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return ImageModel(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }
}
