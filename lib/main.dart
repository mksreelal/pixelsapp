import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelsapp/core/route/routeGenerator.dart';
import 'package:pixelsapp/core/route/routeHelper.dart';
import 'package:pixelsapp/core/route/routeName.dart';
import 'package:pixelsapp/core/theme/theme.dart';
import 'package:pixelsapp/features/homescreen/bloc/homebloc.dart';
import 'package:pixelsapp/features/splashScreen/bloc/splash_bloc.dart';

class CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = CustomHttpOverrides();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(),
        ),
      ],
      child: Limble(),
    ),
  );
}

class Limble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: RouteName.root,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeConfig.appTheme,
    );
  }
}
