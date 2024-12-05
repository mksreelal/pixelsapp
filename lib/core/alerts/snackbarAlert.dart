import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:pixelsapp/core/presentation/widgets/qtext.dart';
import 'package:pixelsapp/core/res/colors.dart';
import 'package:pixelsapp/core/route/routeHelper.dart';

class SnackBarAlert {
  SnackBarAlert() {
    ScaffoldMessenger.of(getCurrentContext()).hideCurrentSnackBar();
  }

  /// Basic SnackBar with customized width
  basicSnackBar(
    String title, {
    Color color = ColorsRes.primaryblue,
    Color titleColor = Colors.white,
    int seconds = 1,
    SnackBarPosition position = SnackBarPosition.bottom,
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: color,
        duration: Duration(seconds: seconds),
        behavior: SnackBarBehavior.floating,
        content: Container(
          height: 20,
          child: QText(
            title,
            color: titleColor,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  /// Error SnackBar with customized width
  errorSnackBar(
    String content, {
    String? title,
    int seconds = 1,
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.only(),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        duration: Duration(seconds: seconds),
        content: Container(
          height: 20,
          child: QText(
            content,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

EdgeInsets _getSnackBarMargin(SnackBarPosition position) {
  switch (position) {
    case SnackBarPosition.top:
      return const EdgeInsets.only(
          left: 10, right: 10, top: 10); // SnackBar at the top
    case SnackBarPosition.bottom:
    default:
      return const EdgeInsets.only(
          left: 10, right: 10, bottom: 10); // Default to bottom
  }
}

enum SnackBarPosition { top, bottom }
