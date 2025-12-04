import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/pages/application/bloc/app_blocs.dart';
import 'package:step_counter/pages/home/bloc/home_blocs.dart';
import 'package:step_counter/pages/sign_up/bloc/sign_up_blocs.dart';
import 'package:step_counter/pages/signin/bloc/sign_in_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
    BlocProvider(create: (context) => HomeBlocs()),
    BlocProvider(create: (context) => SignInBlocs()),
    BlocProvider(create: (context) => SignUpBlocs()),
    BlocProvider(create: (context) => AppBlocs()),
  ];
}
