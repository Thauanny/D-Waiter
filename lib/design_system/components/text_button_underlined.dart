import 'package:d_waiter/design_system/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextButtonUnderlined extends StatefulWidget {
  final String text;
  final double? fontSize;
  final bool interactable;

  const TextButtonUnderlined({
    Key? key,
    this.fontSize,
    required this.text,
    required this.interactable,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TextButtonUnderlinedState();
  }
}

class TextButtonUnderlinedState extends State<TextButtonUnderlined> {
  RxBool pressed = false.obs;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed:
            widget.interactable ? () => pressed.value = !pressed.value : null,
        child: Obx(() => Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.fontSize,
                shadows: [
                  Shadow(
                      color: pressed.value ? primaryOrange : Colors.grey,
                      offset: const Offset(0, -8))
                ],
                color: Colors.transparent,
                decoration:
                    widget.interactable ? TextDecoration.underline : null,
                decorationColor: primaryOrange,
                decorationThickness: 3,
                decorationStyle: TextDecorationStyle.solid,
              ),
            )));
  }
}
