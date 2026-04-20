class NewsModel {
  final String id;
  final String title;
  final String content;
  final String image;
  final String author;

  NewsModel({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.author,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      image: json['image'] ?? '',
      author: json['author'] ?? '',
    );
  }
}