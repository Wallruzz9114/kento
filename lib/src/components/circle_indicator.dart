import 'package:flutter/material.dart';
import 'package:kento/src/config/palette.dart';

class CircleIndicator extends StatefulWidget {
  const CircleIndicator(this.isActive);

  final bool isActive;

  @override
  _CircleIndicatorState createState() => _CircleIndicatorState();
}

class _CircleIndicatorState extends State<CircleIndicator> {
  @override
  AnimatedContainer build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: widget.isActive ? 12 : 8,
      width: widget.isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: widget.isActive
              ? Palette.primaryColor
              : Palette.secondaryTextColorLight,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
