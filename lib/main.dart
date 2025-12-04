import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_counter/common/shared/color.dart';
import 'package:step_counter/pages/application/application_page.dart';
import 'package:step_counter/pages/bloc_providers.dart';
import 'package:step_counter/pages/sign_up/sign_up.dart';
import 'package:step_counter/pages/signin/sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),

        builder: (context, child) => MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.background,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: SignIn(),
          routes: {
            '/application': (context) => const ApplicationPage(),
            '/signin': (context) => const SignIn(),
            '/signup': (context) => const SignUp(),
          },
        ),
      ),
    );
  }
}
