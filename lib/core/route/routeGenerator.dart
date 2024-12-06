import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelsapp/core/presentation/pages/routeNotFound.dart';
import 'package:pixelsapp/core/route/routeName.dart';
import 'package:pixelsapp/features/homescreen/bloc/homebloc.dart';
import 'package:pixelsapp/features/homescreen/presentation/homeScreen.dart';
import 'package:pixelsapp/features/homescreen/presentation/pages/ImagePreview.dart';
import 'package:pixelsapp/features/splashScreen/presentation/splashScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;
    final args = settings.arguments;

    switch (name) {
      case RouteName.root:
        return pageRoute(const SplashScreen());
      case RouteName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HomeBloc>.value(
            value: BlocProvider.of<HomeBloc>(context),
            child: const HomeScreen(),
          ),
        );
      case RouteName.imagePreview:
        return MaterialPageRoute(
          builder: (context) {
            // Pass the necessary arguments if required for ImagePreviewScreen
            return BlocProvider<HomeBloc>.value(
              value: BlocProvider.of<HomeBloc>(context),
              child: const ImagePreviewScreen(),
            );
          },
        );
      default:
        return pageRoute(const RouteNotFoundPage());
    }
  }
}

pageRoute(Widget page) {
  return MaterialPageRoute(builder: (_) => page);
}
