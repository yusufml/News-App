// ignore: camel_case_types
class newsModel {
  ////https://javiercbk.github.io/json_to_dart/  Jsonı direkt olarak dart olarak alınabilir.

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  newsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  newsModel.fromJson(Map<String, dynamic> json) {
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }
}
