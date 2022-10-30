import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final BoxDecoration decoration;
  final Widget child;
  final void Function() onPressed;
  const Button(
      {super.key,
      required this.child,
      this.decoration = const BoxDecoration(),
      required this.onPressed});

  Button.outlined(
      {super.key,
      required this.child,
      required this.onPressed,
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
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: decoration,
      child: Center(
        child: InkWell(
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}
