import 'package:dio/dio.dart';

class FeedPostRequest {
  String content;
  bool isPublic;
  MultipartFile? imageFile;
  List<int> wineIdList;

  FeedPostRequest(this.content, this.isPublic, this.imageFile, this.wineIdList);

  @override
  String toString() {
    return 'FeedPostRequest{content: $content, isPublic: $isPublic, imageFile: $imageFile, wineIdList: $wineIdList}';
  }
}