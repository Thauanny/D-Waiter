import 'package:d_waiter/design_system/colors.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../controllers/home_controller.dart';

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          fillColor: secondwhite,
          filled: true,
          prefixIcon: const Icon(
            Icons.search,
            color: primaryOrange,
            size: 35,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(80)),
          ),
          hintText: "search-text".i18n(),
        ),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          controller.searchText.value = value;
          controller.fetchSearchFood();
        });
  }
}
