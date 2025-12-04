class SignUpStates {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  const SignUpStates({
    this.username = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
  });
  SignUpStates copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpStates(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
