import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../utils/utils.export.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startAppInSplash(){
    emit(SplashStartAppState());
    Future.delayed(const Duration(seconds: 3), () => navigateToHomeScreen());
  }

  void navigateToHomeScreen(){
    CustomNavigator.push(Routes.homeScreen);
  }
}
