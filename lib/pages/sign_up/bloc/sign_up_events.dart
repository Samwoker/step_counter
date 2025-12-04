abstract class SignUpEvents {
  const SignUpEvents();
}

class UsernameEvent extends SignUpEvents {
  final String username;
  const UsernameEvent(this.username);
}

class EmailEvent extends SignUpEvents {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignUpEvents {
  final String password;
  const PasswordEvent(this.password);
}

class ConfirmPasswordEvent extends SignUpEvents {
  final String confirmPassword;
  const ConfirmPasswordEvent(this.confirmPassword);
}
