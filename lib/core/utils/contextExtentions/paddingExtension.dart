import 'package:flutter/material.dart';
import 'package:pixelsapp/core/res/values.dart';
import 'package:pixelsapp/core/route/routeHelper.dart';
import 'package:pixelsapp/core/utils/contextExtentions/sizeExtentions.dart';


extension PaddingExtension on BuildContext {
  EdgeInsets pagePadding([
    double horizontal = ValuesRes.padHorizontal,
    double vertical = ValuesRes.padVertical,
  ]) {
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }

  EdgeInsets horizontalPadding([
    double horizontal = ValuesRes.padHorizontal,
    double vertical = ValuesRes.padVertical,
  ]) {
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }

  EdgeInsets bottomNavContentPadding({
    double left = ValuesRes.padHorizontal,
    double right = ValuesRes.padHorizontal,
    double top = ValuesRes.padVertical,
    double bottom = ValuesRes.padVertical,
  }) {
    return EdgeInsets.only(top: top, right: right, left: left, bottom: bottom);
  }

  EdgeInsets bottomNavButtonPadding({
    double left = ValuesRes.padHorizontal,
    double right = ValuesRes.padHorizontal,
    double top = ValuesRes.padVertical,
    double bottom = ValuesRes.padVertical,
  }) {
    return EdgeInsets.only(
      top: top,
      right: right,
      left: left,
      bottom: ValuesRes.padVertical + getCurrentContext().getBottomViewInsets,
    );
  }
}
