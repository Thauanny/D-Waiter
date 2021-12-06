import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 242, 242, 242),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              const SizedBox(height: 30),
              SvgPicture.asset(
                'assets/images/login_art.svg',
                semanticsLabel: 'login_art',
              ),
              const SizedBox(height: 30),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(0, -10))
                  ],
                  color: Colors.transparent,
                  decoration:
                  TextDecoration.underline,
                  decorationColor: Color.fromARGB(255, 250, 74, 12),
                  decorationThickness: 3  ,
                  decorationStyle:
                  TextDecorationStyle.solid,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
