import 'package:flutter/material.dart';
import 'package:pixelsapp/features/homescreen/provider/homeprovider.dart';
import 'package:pixelsapp/features/splashScreen/provider/splashProvider.dart';

import 'package:provider/provider.dart';

class ProviderInit extends StatelessWidget {
  final Widget child;

  const ProviderInit({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: child,
    );
  }
}
