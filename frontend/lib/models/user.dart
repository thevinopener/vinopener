class UserModel {
  int? id;
  String? email;
  String? nickname;
  String? imageUrl;
  String? accessToken;
  String? refreshToken;

  UserModel({String? email, required String nickname, required String imageUrl})
      : this.email = email,
        this.nickname = nickname,
        this.imageUrl = imageUrl;

  static UserModel dummy() {
    return UserModel(
        email: 'jeon@ssafy.com',
        nickname: '전원빈',
        imageUrl: 'https://picsum.photos/200/300');
  }

  @override
  String toString() {
    return 'UserModel{id: $id, email: $email, nickname: $nickname, imageUrl: $imageUrl, accessToken: $accessToken, refreshToken: $refreshToken}';
  }
}
