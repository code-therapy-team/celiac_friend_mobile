class LoginModel {
  final String username;
  final String password;
  final String? token;
  final String? refreshToken;

  LoginModel({
    required this.username,
    required this.password,
    this.token,
    this.refreshToken,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username']??'',
      password: json['password']??'',
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }
  Map<String, dynamic> toJson() => {"username": username, "password": password};
}
