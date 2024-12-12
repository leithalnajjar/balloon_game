import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? body;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final AlignmentGeometry alignment;
  final PreferredSizeWidget? appBar;
  final bool enableSafeArea;

  const CustomWidget(
      {super.key,
      this.backgroundColor,
      this.body,
      this.drawer,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.appBar,
      this.alignment = Alignment.center,
      this.enableSafeArea = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: enableSafeArea
          ? SafeArea(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Align(
                  alignment: alignment,
                  child: body,
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Align(
                alignment: alignment,
                child: body,
              ),
            ),
    );
  }
}
