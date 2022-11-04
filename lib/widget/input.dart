import 'package:flutter/material.dart';
import 'package:netflix/theme/colors.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final bool password;
  final Widget action;

  const Input({
    Key? key,
    required this.controller,
    this.action = const SizedBox(),
    this.hint = "",
    this.label = "",
    this.password = false,
  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  late FocusNode focus;
  bool isFocused = false;

  @override
  void initState() {
    focus = FocusNode();
    focus.addListener(() {
      setState(() {
        isFocused = focus.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
          color: NetflixColors.grey, borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          TextFormField(
            obscureText: widget.password,
            focusNode: focus,
            cursorHeight: 20,
            cursorColor: Colors.white,
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0, color: Colors.transparent)),
                border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0, color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0, color: Colors.transparent)),
                hintText: widget.hint,
                labelStyle: Theme.of(context).textTheme.subtitle1,
                floatingLabelStyle: Theme.of(context).textTheme.caption,
                label: Container(
                  margin: EdgeInsets.only(
                      top: isFocused || widget.controller.text != "" ? 40 : 0),
                  child: Text(widget.label),
                ),
                contentPadding: EdgeInsets.only(
                    top: widget.label == "" ? 10 : 20, bottom: 0),
                isCollapsed: true),
            controller: widget.controller,
          ),
          Positioned(right: 0, top: 15, child: widget.action)
        ],
      ),
    );
  }
}
