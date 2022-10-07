import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../login/login_page.dart';
import '../../../controllers/home_controller.dart';

class IconLogOutButonComponent extends StatelessWidget {
  const IconLogOutButonComponent({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //TODO: clean all datas
        Get.off(() => const LoginPage());
      },
      icon: SvgPicture.asset(
        'assets/icons/logout.svg',
        height: 26,
        semanticsLabel: 'logout',
      ),
    );
  }
}
