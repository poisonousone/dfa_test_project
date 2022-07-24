class NewsItem{
  final String userId;
  final String id;
  final String title;
  final String body;

  NewsItem({
    required this.userId,
    required this.id,
    required this.title,
    required this.body
  });

  factory NewsItem.fromJson(dynamic json) => NewsItem(
    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    body: json['body']
  );
}