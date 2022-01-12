import 'package:flutter/material.dart';

Widget PrimaryButton(BuildContext context, String text, Function() onPressed,
        [isActive = true]) =>
    TextButton(
      style: TextButton.styleFrom(
        fixedSize: const Size(350, 70),
        primary: Colors.white,
        backgroundColor:
            isActive ? Theme.of(context).colorScheme.secondary : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: isActive ? onPressed : () {},
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
        ),
        textAlign: TextAlign.center,
      ),
    );
