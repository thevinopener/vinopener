class User {
  String? email;
  String? nickname;
  String? imageUrl;
  String? refreshToken;

  User({required String email, required String nickname, required String imageUrl, required String refreshToken});

  static User dummy() {
    return User(
      email: 'jeon@ssafy.com',
      nickname: '전원빈',
      imageUrl: 'assets/images/penguin.jpg',
      refreshToken: 'refresh',
    );
  }
}
