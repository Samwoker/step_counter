import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/common/widgets/toast_info.dart';
import 'package:step_counter/pages/sign_up/bloc/sign_up_blocs.dart';

class SignUpController {
  final BuildContext context;
  const SignUpController({required this.context});

  Future<void> handleSignUp() async {
    final state = context.read<SignUpBlocs>().state;
    final String username = state.username.trim();
    final String email = state.email.trim();
    final String password = state.password.trim();
    final String confirmPassword = state.confirmPassword.trim();

    if (username.isEmpty) {
      toastInfo(msg: "Username field is empty");
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email field is empty");
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password field is empty");
    }
    if (confirmPassword.isEmpty) {
      toastInfo(msg: "ConfirmPassword field is empty");
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        Navigator.of(context).pushReplacementNamed("/signin");
        print("user created");
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        // success toast info
        // ignore: use_build_context_synchronously
      } else {
        print("user not exist");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "Weak password");
      }
      if (e.code == 'email-already-in-use') {
        toastInfo(msg: "Email already in use");
      }
      if (e.code == 'invalid-email') {
        toastInfo(msg: "Invalid Email");
      }
    }
  }
}
