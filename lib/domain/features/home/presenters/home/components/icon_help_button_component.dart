import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import '../../../../../../design_system/colors.dart';
import '../../../controllers/home_controller.dart';

class IconHelpButonComponent extends StatelessWidget {
  const IconHelpButonComponent({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('instructions-text'.i18n()),
              content: Text('instructions-info-text'.i18n()),
            );
          },
        );
      },
      icon: SvgPicture.asset(
        'assets/icons/help.svg',
        semanticsLabel: 'help',
        height: 26,
        color: primaryOrange,
      ),
    );
  }
}
