import 'dart:ui';

import 'package:d_waiter/design_system/colors.dart';
import 'package:d_waiter/design_system/components/food_card.dart';
import 'package:d_waiter/design_system/components/primary_button.dart';
import 'package:d_waiter/domain/features/checkout/checkout_page.dart';
import 'package:d_waiter/domain/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  final HomeController controller;

  const OrderPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    'Orders',
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
            child: controller.orders.isEmpty
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 3.5),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.shopping_cart_rounded,
                            size: 150,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            child: Text(
                              'No orders yet',
                              style:
                                  TextStyle(fontSize: 50, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : ListView(
                    children: List.generate(controller.orders.length, (i) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            shadowColor: Colors.grey.withOpacity(0.3),
                            color: Colors.transparent,
                            elevation: 40,
                            child: Stack(
                              children: [
                                foodCard(context, controller,
                                    controller.orders[i], false),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, right: 70),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: primaryOrange,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          width: 60,
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              controller.orders
                                                  .elementAt(i)
                                                  .quantity
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: primaryWhite,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        /* Text(
                                          controller.orders
                                                  .elementAt(i)
                                                  .orderAt!
                                                  .hour
                                                  .toString() +
                                              'h' +
                                              controller.orders
                                                  .elementAt(i)
                                                  .orderAt!
                                                  .minute
                                                  .toString() +
                                              'm',
                                          style: const TextStyle(
                                              color: primaryOrange,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),*/
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      );
                    }),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PrimaryButton(
                text: 'Finalizar atendimento e realizar pagamento',
                onPressed: () {
                  Get.to(() => CheckoutPage(
                        controller: controller,
                      ));
                },
                isActive: controller.orders.isNotEmpty),
          ),
        ],
      ),
    );
  }
}
