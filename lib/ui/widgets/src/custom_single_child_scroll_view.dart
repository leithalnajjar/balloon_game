import 'dart:ui';

import 'package:flutter/material.dart';

class CustomSingleChildScrollView extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? child;

  const CustomSingleChildScrollView({
    super.key,
    this.padding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: child,
      ),
    );
  }
}
