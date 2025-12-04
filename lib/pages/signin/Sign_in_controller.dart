import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/common/widgets/toast_info.dart';
import 'package:step_counter/pages/signin/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn() async {
    final state = context.read<SignInBlocs>().state;
    final String email = state.email;
    final String password = state.password;

    if (email.isEmpty) {
      toastInfo(msg: "Email field is empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password field is empty");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        Navigator.of(context).pushReplacementNamed("/application");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "Weak password");
      }
      if (e.code == 'invalid-email') {
        toastInfo(msg: "Invalid email");
      }
    }
  }
}
