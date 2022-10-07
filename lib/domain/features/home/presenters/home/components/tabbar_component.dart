import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../../../../design_system/colors.dart';
import '../../../../../../design_system/components/text_button_underlined.dart';

class TabBarComponent extends StatelessWidget {
  const TabBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        automaticIndicatorColorAdjustment: true,
        labelColor: primaryOrange,
        isScrollable: true,
        indicatorColor: primaryOrange,
        labelStyle: const TextStyle(color: primaryOrange),
        tabs: [
          Tab(
            child: TextButtonUnderlined(
              text: 'foods-label-text'.i18n(),
              fontSize: 18,
              interactable: false,
            ),
          ),
          Tab(
            child: TextButtonUnderlined(
              text: 'drinks-label-text'.i18n(),
              fontSize: 18,
              interactable: false,
            ),
          ),
          Tab(
            child: TextButtonUnderlined(
              text: 'snacks-label-text'.i18n(),
              fontSize: 18,
              interactable: false,
            ),
          ),
          Tab(
            child: TextButtonUnderlined(
              text: 'sauces-label-text'.i18n(),
              fontSize: 18,
              interactable: false,
            ),
          ),
        ]);
  }
}
