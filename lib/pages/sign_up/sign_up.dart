import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_counter/common/shared/color.dart';
import 'package:step_counter/pages/sign_up/bloc/sign_up_blocs.dart';
import 'package:step_counter/pages/sign_up/bloc/sign_up_events.dart';
import 'package:step_counter/pages/sign_up/bloc/sign_up_states.dart';
import 'package:step_counter/pages/sign_up/sign_up_controller.dart';
import 'package:step_counter/pages/sign_up/widgets/sign_up_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBlocs, SignUpStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 70.h),
                    buildTextField("Username", "username", (value) {
                      context.read<SignUpBlocs>().add(UsernameEvent(value));
                    }),
                    buildTextField("Email", "email", (value) {
                      context.read<SignUpBlocs>().add(EmailEvent(value));
                    }),
                    buildTextField("Password", "password", (value) {
                      context.read<SignUpBlocs>().add(PasswordEvent(value));
                    }),
                    buildTextField("Confirm Password", "password", (value) {
                      context.read<SignUpBlocs>().add(
                        ConfirmPasswordEvent(value),
                      );
                    }),
                    buildButton("SignUp", () {
                      SignUpController(context: context).handleSignUp();
                    }),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 12.h, bottom: 12.h),
                        child: Text(
                          "or",
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    buildThirdPartyButtons("Continue with Google", "google"),
                    buildThirdPartyButtons(
                      "Continue with Facebook",
                      "facebook",
                    ),
                    signUpAndSignInLinks(
                      "Already have an account? ",
                      "LogIn",
                      () {
                        Navigator.of(context).pushNamed("/signin");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
