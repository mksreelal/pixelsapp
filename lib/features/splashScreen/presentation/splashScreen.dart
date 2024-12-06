import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pixelsapp/core/res/colors.dart';
import 'package:pixelsapp/core/res/imagespaths.dart';
import 'package:pixelsapp/core/route/routeHelper.dart';
import 'package:pixelsapp/core/utils/contextExtentions/sizeExtentions.dart';
import 'package:pixelsapp/features/splashScreen/bloc/splash_bloc.dart';
import 'package:pixelsapp/features/splashScreen/bloc/splash_state.dart';
import 'package:pixelsapp/features/splashScreen/bloc/splashevent.dart';
import 'package:pixelsapp/core/route/routeName.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(StartSplash()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigate) {
            pushNamed(RouteName.homeScreen);
          }
        },
        child: Scaffold(
          backgroundColor: ColorsRes.white,
          body: SizedBox(
            width: context.getWidth,
            height: context.getHeight,
            child: Lottie.asset(ImagesRes.logoImage),
          ),
        ),
      ),
    );
  }
}
