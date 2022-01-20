import 'package:d_waiter/design_system/colors.dart';
import 'package:d_waiter/design_system/components/food_card.dart';
import 'package:d_waiter/design_system/components/primary_button.dart';
import 'package:d_waiter/domain/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatelessWidget {
  final HomeController controller;

  const CheckoutPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in controller.orders) {
      total += item.price;
    }
    var height = (MediaQuery.of(context).size.height);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 50, bottom: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.close(1);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: primaryOrange,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 2),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Paymant'),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Table Nuber'),
                ),
                const Card(
                  child: Text('4'),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Payment Method'),
                ),
                Card(
                  child: Column(
                    children: [
                      Row(
                        children: [],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(total.toString()),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PrimaryButton(
                text: 'Complete Order',
                onPressed: () {},
                isActive: controller.orders.isNotEmpty),
          ),
        ],
      ),
    );
  }
}
