import 'package:d_waiter/modules/authentication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
                semanticsLabel: 'logo',
                height: 86,
                width: 87,
              ),
            ),
          ),
          const SizedBox(height: 55),
          const Text(
            'D-Waiter',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          const SizedBox(height: 69),
          Stack(children: [
            SvgPicture.asset(
              'assets/images/people.svg',
              semanticsLabel: 'people',
              alignment: Alignment.topCenter,
            ),
            Positioned(
              top: 430,
              left: 20,
              right: 20,
              child: TextButton(
                style: TextButton.styleFrom(
                  fixedSize: const Size(300, 60),
                  primary: Theme.of(context).colorScheme.secondary,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () => Get.off(() => const LoginPage()),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
