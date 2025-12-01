import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_counter/common/shared/color.dart';
import 'package:step_counter/pages/signin/bloc/sign_in_blocs.dart';
import 'package:step_counter/pages/signin/bloc/sign_in_events.dart';
import 'package:step_counter/pages/signin/bloc/sign_in_states.dart';
import 'package:step_counter/pages/signin/widgets/signin_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlocs, SignInStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(),
              body: Column(
                children: [
                  SizedBox(height: 50.h),
                  buildTextField("Email", "email", (value) {
                    context.read<SignInBlocs>().add(EmailEvent(value));
                  }),
                  buildTextField("Password", "password", (value) {
                    context.read<SignInBlocs>().add(PasswordEvent(value));
                  }),
                  buildButton("Login"),
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
                  SizedBox(height: 16.h),
                  buildThirdPartyButtons("Continue With Facebook", "facebook"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
