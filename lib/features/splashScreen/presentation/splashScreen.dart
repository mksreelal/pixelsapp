import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pixelsapp/core/res/colors.dart';
import 'package:pixelsapp/core/res/imagespaths.dart';
import 'package:pixelsapp/core/utils/contextExtentions/sizeExtentions.dart';
import 'package:pixelsapp/features/splashScreen/provider/splashProvider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashProvider _provider = SplashProvider();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _provider.initFunction();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of(context);
    return Scaffold(
      backgroundColor: ColorsRes.white,
      body: SizedBox(
        width: context.getWidth,
        height: context.getHeight,
        child: Lottie.asset(ImagesRes.logoImage),
      ),
    );
  }
}
