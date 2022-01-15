import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../design_system/components/second_button.dart';
import '../login/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
                semanticsLabel: 'logo',
              ),
            ),
          ),
          const Text(
            'D-Waiter',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          Stack(children: [
            SvgPicture.asset(
              'assets/images/people.svg',
              semanticsLabel: 'people',
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 1.7,
                left: MediaQuery.of(context).size.width / 8,
              ),
              child: secondButton(
                context,
                'Get Started',
                () => Get.off(() => const LoginPage()),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
