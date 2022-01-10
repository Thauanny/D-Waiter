import 'package:flutter/material.dart';

Widget PrimaryButton(BuildContext context, String text, Function() onPressed) =>
    TextButton(
      style: TextButton.styleFrom(
        fixedSize: const Size(300, 60),
        primary: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.secondary,
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
