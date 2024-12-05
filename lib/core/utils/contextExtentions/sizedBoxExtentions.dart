import 'package:flutter/material.dart';
import 'package:pixelsapp/core/res/values.dart';

extension SizedBoxExtentions on BuildContext {
  SizedBox rowGap([double? width]) =>
      SizedBox(width: width ?? ValuesRes.rowGap);

  SizedBox columnGap([double? height]) => SizedBox(
        height: height ?? ValuesRes.columnGap,
      );

  SliverToBoxAdapter sliverColumnGap([double? height]) => SliverToBoxAdapter(
        child: SizedBox(
          height: height ?? ValuesRes.columnGap,
        ),
      );
}
