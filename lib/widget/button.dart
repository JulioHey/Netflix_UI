import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final BoxDecoration decoration;
  final Widget child;
  final void Function() onPressed;
  final EdgeInsets padding;
  const Button(
      {super.key,
      required this.child,
      this.decoration = const BoxDecoration(),
      this.padding = const EdgeInsets.symmetric(vertical: 12),
      required this.onPressed});

  const Button.outlined(
      {super.key,
      required this.child,
      required this.onPressed,
      this.padding = const EdgeInsets.symmetric(vertical: 12),
      this.decoration = const BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.white),
            right: BorderSide(color: Colors.white),
            left: BorderSide(color: Colors.white),
            bottom: BorderSide(color: Colors.white)),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      )});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Center(
        child: Container(
          padding: padding,
          decoration: decoration,
          child: child,
        ),
      ),
    );
  }
}
