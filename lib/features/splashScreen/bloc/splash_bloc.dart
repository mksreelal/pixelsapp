import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelsapp/features/splashScreen/bloc/splash_state.dart';
import 'package:pixelsapp/features/splashScreen/bloc/splashevent.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<StartSplash>(_onStartSplash);
  }

  Future<void> _onStartSplash(
      StartSplash event, Emitter<SplashState> emit) async {
    await Future.delayed(Duration(seconds: 3));

    emit(SplashNavigate());
  }
}
