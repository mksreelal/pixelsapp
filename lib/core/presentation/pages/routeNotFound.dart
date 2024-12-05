import 'package:flutter/material.dart';
import 'package:pixelsapp/core/presentation/widgets/qtext.dart';

class RouteNotFoundPage extends StatelessWidget {
  const RouteNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            QText(
              "Sorry the page is unavailable",
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
