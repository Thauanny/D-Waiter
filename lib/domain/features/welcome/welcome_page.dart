import 'package:d_waiter/domain/features/home/presenters/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';
import '../../../design_system/colors.dart';
import '../../../design_system/components/second_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryOrange,
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
          SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/people.svg',
                    semanticsLabel: 'people',
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: secondButton(
                    context,
                    'get-started-text'.i18n(),
                    () => Get.off(() => HomePage()),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
