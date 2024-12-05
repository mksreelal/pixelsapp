import 'package:flutter/material.dart';

extension SizeExtentions on BuildContext {
  double get splashLogoWidth {
    double width = MediaQuery.of(this).size.width * .55;
    return width;
  }

  double get getBottomViewInsets {
    return MediaQuery.of(this).viewInsets.bottom;
  }

  double get getWidth {
    double width = MediaQuery.of(this).size.width;
    return width;
  }

  double get getHeight {
    double height = MediaQuery.of(this).size.height;
    return height;
  }

}

