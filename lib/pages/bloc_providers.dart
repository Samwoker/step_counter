import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/pages/home/bloc/home_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
    BlocProvider(create: (context) => HomeBlocs()),
  ];
}
