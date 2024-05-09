class SearchHistory {
  final int id;
  final int userId;
  final String content;

  SearchHistory({
    required this.id,
    required this.userId,
    required this.content,
  });

  factory SearchHistory.fromJson(Map<String, dynamic> json) {
    return SearchHistory(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
    };
  }
}
