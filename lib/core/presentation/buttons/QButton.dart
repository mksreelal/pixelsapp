import 'package:flutter/material.dart';
import 'package:pixelsapp/core/presentation/widgets/qtext.dart';

class QButton extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;
  final bool loading;
  final Color color;
  final Color titleColor;
  final Color loadingColor;
  final double radius;
  final double elevation;
  final double height;
  final double? width;
  final Color borderColor;
  final double titleSize;
  final VisualDensity? visualDensity;
  final Widget? child;
  final FontWeight fontWeight;

  const QButton({
    Key? key,
    this.title = "",
    required this.onTap,
    this.loading = false,
    this.color = Colors.black,
    this.titleColor = Colors.white,
    this.loadingColor = Colors.white,
    this.radius = 10,
    this.elevation = 0,
    this.height = 55,
    this.width = double.infinity,
    this.borderColor = Colors.transparent,
    this.titleSize = 14.5,
    this.visualDensity,
    this.fontWeight = FontWeight.w500,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: color,
      height: height,
      elevation: elevation,
      minWidth: width,
      visualDensity: visualDensity,
      disabledColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(color: borderColor),
      ),
      child: loading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
              ),
            )
          : child ??
              QText(
                title,
                color: titleColor,
                fontWeight: fontWeight,
                letterSpacing: .9,
                fontSize: titleSize,
              ),
    );
  }
}
