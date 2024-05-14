class SearchBookmarkStatus {
  final bool isBookmark;

  SearchBookmarkStatus({required this.isBookmark});

  factory SearchBookmarkStatus.fromJson(Map<String, dynamic> json) {
    return SearchBookmarkStatus(
      isBookmark: json['isBookmark'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isBookmark': isBookmark,
    };
  }
}
