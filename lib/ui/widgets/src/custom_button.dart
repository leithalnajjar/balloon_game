import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Widget? child;
  Color? backgroundColor;
  Color? foregroundColor;
  TextStyle? textStyle;
  EdgeInsetsGeometry? padding;
  void Function()? onPressed;
  void Function()? onLongPress;
  EdgeInsetsGeometry? margin;
  double? width;
  bool? fixed;
  BorderSide? side;
  double? borderRadius;

  CustomButton({
    super.key,
    this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.padding,
    this.borderRadius,
    this.width,
    this.fixed = false,
    this.onPressed,
    this.side,
    this.onLongPress,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
      width: fixed! ? width : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: textStyle,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            side: side ?? BorderSide.none,
          ),
          elevation: 0.0,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: child,
      ),
    );
  }
}
