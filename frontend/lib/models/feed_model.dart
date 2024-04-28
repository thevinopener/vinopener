class FeedModel {
  final int userId;
  final int feedId;
  final String content;
  final String imageUrl;
  final bool isPublic;

  FeedModel(
      {required this.userId,
      required this.feedId,
      required this.content,
      required this.imageUrl,
      required this.isPublic});

  FeedModel.dummy()
      : userId = 1,
        feedId = 101,
        content = 'This is a sample feed content.',
        imageUrl = 'https://picsum.photos/120/120',
        isPublic = true;
}
