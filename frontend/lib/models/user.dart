class User {
  String? email;
  String? nickname;
  String? imageUrl;
  String? refreshToken;

  User({required this.email, required this.nickname, required this.imageUrl, required this.refreshToken});

  static User dummy() {
    return User(
      email: 'jeon@ssafy.com',
      nickname: '전원빈',
      imageUrl: 'assets/images/penguin.jpg',
      refreshToken: 'refresh',
    );
  }

  @override
  String toString() {
    return 'User{email: $email, nickname: $nickname, imageUrl: $imageUrl, refreshToken: $refreshToken}';
  }
}
