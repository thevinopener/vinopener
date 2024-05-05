class Token {
  String? refreshToken;
  String? accessToken;

  Token.fromJson(Map<String, dynamic> json) {
    refreshToken = json["refresh-token"];
    accessToken = json["access-token"];
  }

  @override
  String toString() {
    return 'Token{refreshToken: $refreshToken, accessToken: $accessToken}';
  }
}