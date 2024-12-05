enum Size {
  medium, //normal size text
  bold, //only bold text
  boldMedium, //bold with medium
  boldLarge, //bold with large
  extraLarge //extra large
}

enum Aligns {
  left, //ESC_ALIGN_LEFT
  center, //ESC_ALIGN_CENTER
  right, //ESC_ALIGN_RIGHT
}

extension PrintSize on Size {
  int get val {
    switch (this) {
      case Size.medium:
        return 0;
      case Size.bold:
        return 1;
      case Size.boldMedium:
        return 2;
      case Size.boldLarge:
        return 3;
      case Size.extraLarge:
        return 10;
      default:
        return 0;
    }
  }
}

extension PrintAlign on Aligns {
  int get val {
    switch (this) {
      case Aligns.left:
        return 0;
      case Aligns.center:
        return 1;
      case Aligns.right:
        return 2;
      default:
        return 0;
    }
  }
}
