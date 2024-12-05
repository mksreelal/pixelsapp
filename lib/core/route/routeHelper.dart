import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

BuildContext getCurrentContext() {
  return navigatorKey.currentContext!;
}

Future pushNamed(String routeName, {BuildContext? context, dynamic args}) {
  BuildContext currentContext = context ?? navigatorKey.currentContext!;
  return Navigator.pushNamed(currentContext, routeName, arguments: args);
}

pushAndReplaceNamed(String routeName, {BuildContext? context, dynamic args}) {
  BuildContext currentContext = context ?? navigatorKey.currentContext!;
  Navigator.pushReplacementNamed(currentContext, routeName, arguments: args);
}

pushAndRemoveUntil(String routeName, {BuildContext? context, dynamic args}) {
  BuildContext currentContext = context ?? navigatorKey.currentContext!;
  Navigator.pushNamedAndRemoveUntil(
    currentContext,
    routeName,
    arguments: args,
    (route) => false,
  );
}

pop() {
  Navigator.pop(getCurrentContext());
}
