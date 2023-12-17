import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meteo_weather/features/feature.export.dart';

MultiBlocProvider listOfBlocProviders(Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<HomeBloc>(
        create: (_) => HomeBloc(),
      ),
      BlocProvider<SplashCubit>(
        create: (_) => SplashCubit(),
      ),
      BlocProvider<PlayControllerBloc>(
        create: (_) => PlayControllerBloc(),
      ),
    ],
    child: child,
  );
}
