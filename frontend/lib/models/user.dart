class UserModel {
  String? _email;
  String? _nickname;
  String? _imageUrl;
  String? _accessToken;
  String? _refreshToken;

  UserModel({required String email, required String nickname, required String imageUrl})
      : _email = email,
        _nickname = nickname,
        _imageUrl = imageUrl;

  static UserModel dummy() {
    return UserModel(
        email: 'jeon@ssafy.com',
        nickname: '전원빈',
        imageUrl: 'https://picsum.photos/200/300');
  }


  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get nickname => _nickname;

  set nickname(String? value) {
    _nickname = value;
  }

  String? get imageUrl => _imageUrl;

  set imageUrl(String? value) {
    _imageUrl = value;
  }

  String? get accessToken => _accessToken;

  set accessToken(String? value) {
    _accessToken = value;
  }

  String? get refreshToken => _refreshToken;

  set refreshToken(String? value) {
    _refreshToken = value;
  }

  @override
  String toString() {
    return 'User{_email: $_email, _nickname: $_nickname, _imageUrl: $_imageUrl, _accessToken: $_accessToken, _refreshToken: $_refreshToken}';
  }
}
