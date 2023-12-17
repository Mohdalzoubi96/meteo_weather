import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meteo_weather/features/feature.export.dart';
import 'package:meteo_weather/utils/utils.export.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SplashCubit>().startAppInSplash();
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        if(state is SplashStartAppState){
          return Scaffold(
            backgroundColor: const Color(0xFF1c46f2),
            body: SafeArea(
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: Center(
                  child: Image.asset(AppAssets.meteoLogo),
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
