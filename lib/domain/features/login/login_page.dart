import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/components/primary_button.dart';
import '../home/presenters/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State {
  static const double _loginRadius = 30.0;
  static const double _loginSpace = 30.0;
  static const double _loginPadding = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(_loginRadius),
                  bottomLeft: Radius.circular(_loginRadius)),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              const SizedBox(height: _loginSpace),
              SvgPicture.asset(
                'assets/images/login_art.svg',
                semanticsLabel: 'login_art',
              ),
              const SizedBox(height: _loginSpace),
              Text(
                'login-label-text'.i18n(),
                style: const TextStyle(
                  fontSize: 16,
                  shadows: [
                    Shadow(color: Colors.black, offset: Offset(0, -10))
                  ],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: primaryOrange,
                  decorationThickness: 3,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ]),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 20,
                    left: _loginPadding,
                    right: _loginPadding),
                child: TextField(
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: "table-number-text".i18n()),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: _loginPadding, right: _loginPadding),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: "password-text".i18n()),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 8),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "forgot-password-text".i18n(),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    )),
              ),
            ],
          ),
          PrimaryButton(
              text: 'login-label-text'.i18n(),
              onPressed: () => Get.off(
                    () => HomePage(),
                  )),
        ],
      ),
    );
  }
}
