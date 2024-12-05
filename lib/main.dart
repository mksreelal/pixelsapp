import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pixelsapp/core/init/providerInit.dart';
import 'package:pixelsapp/core/route/routeGenerator.dart';
import 'package:pixelsapp/core/route/routeHelper.dart';
import 'package:pixelsapp/core/route/routeName.dart';
import 'package:pixelsapp/core/theme/theme.dart';


class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = PostHttpOverrides();
  runApp(
    const ProviderInit(
      child: Limble(),
    ),
  );
}

class Limble extends StatelessWidget {
  const Limble({super.key});

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
