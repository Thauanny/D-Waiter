import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../cart/cart_page.dart';
import '../../../controllers/home_controller.dart';

class IconCartButonComponent extends StatelessWidget {
  const IconCartButonComponent({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.to(() => CartPage(controller: controller));
      },
      icon: SvgPicture.asset(
        'assets/icons/shopping_cart.svg',
        semanticsLabel: 'shopping_cart',
        height: 26,
      ),
    );
  }
}
