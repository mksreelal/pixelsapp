import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pixelsapp/core/presentation/pages/routeNotFound.dart';
import 'package:pixelsapp/core/route/routeName.dart';
import 'package:pixelsapp/features/homescreen/presentation/homeScreen.dart';
import 'package:pixelsapp/features/homescreen/presentation/pages/ImagePreview.dart';
import 'package:pixelsapp/features/splashScreen/presentation/splashScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;
    final arg = settings.arguments;

    switch (name) {
      case RouteName.root:
        return pageRoute(const SplashScreen());
      case RouteName.homeScreen:
        return pageRoute(const HomeScreen());
      case RouteName.imagePreview:
        return pageRoute(const ImagePreviewScreen());
      default:
        return pageRoute(const RouteNotFoundPage());
    }
  }
}

pageRoute(Widget page) {
  return MaterialPageRoute(builder: (_) => page);
}
