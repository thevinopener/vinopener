class UserInfo {
  late int id;
  late String email;
  late String nickname;
  late String imageUrl;

  UserInfo(this.id, this.email, this.nickname, this.imageUrl);

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    nickname = json['nickname'];
    imageUrl = json['imageUrl'];
  }

  @override
  String toString() {
    return 'UserInfo{id: $id, email: $email, nickname: $nickname, imageUrl: $imageUrl}';
  }
}
