import "package:flutter_bloc/flutter_bloc.dart";
import "package:satset/module/splash%20screen/splash_event.dart";
import "package:satset/module/splash%20screen/splash_state.dart";



class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    {}
  }
}
