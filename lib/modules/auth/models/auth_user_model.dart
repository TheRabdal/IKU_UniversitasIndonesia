class AuthUserModel {
  final String username;
  final String email;
  final String role;
  final String token;

  const AuthUserModel({
    required this.username,
    required this.email,
    required this.role,
    required this.token,
  });
}
