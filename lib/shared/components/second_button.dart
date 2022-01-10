import 'package:flutter/material.dart';

Widget SecondButton(BuildContext context, String text, Function() onPressed) =>
    TextButton(
      style: TextButton.styleFrom(
        fixedSize: const Size(300, 60),
        primary: Theme.of(context).colorScheme.secondary,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
