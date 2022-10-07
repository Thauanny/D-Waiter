import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../orders/orders_page.dart';
import '../../../controllers/home_controller.dart';

class IconOrdersButonComponent extends StatelessWidget {
  const IconOrdersButonComponent({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.to(() => OrderPage(
              controller: controller,
            ));
      },
      icon: SvgPicture.asset(
        'assets/icons/notes.svg',
        semanticsLabel: 'notes',
        height: 26,
      ),
    );
  }
}
