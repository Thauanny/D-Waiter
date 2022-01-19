import 'package:d_waiter/design_system/colors.dart';
import 'package:d_waiter/domain/features/home/controllers/home_controller.dart';
import 'package:d_waiter/domain/features/home/presenters/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InPreparationPage extends StatelessWidget {
  final HomeController controller;
  const InPreparationPage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 50),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  controller.cart.clear();

                  Get.close(1);
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: primaryOrange,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Center(
              child: Text(
                'Em preparo',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: primaryOrange),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Center(
              child: Image.asset(
                'assets/images/em_preparo.gif',
                alignment: Alignment.center,
                fit: BoxFit.fitHeight,
                height: 700,
                width: 400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
