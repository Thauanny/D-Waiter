import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../design_system/colors.dart';
import '../../../design_system/components/food_card.dart';
import '../../../design_system/components/primary_button.dart';
import '../../features/home/controllers/home_controller.dart';

class CartPage extends StatelessWidget {
  final HomeController controller;

  const CartPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = (MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: primaryOrange,
      ),
      body: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: controller.cart.isEmpty
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
                : GridView.count(
                      childAspectRatio: 40 / 50,
                      crossAxisCount: 2,
                      children: List.generate(controller.cart.length, (i) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
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
                                      controller.cart[i], false),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, right: 20.0),
                                      child: IconButton(
                                          onPressed: () =>
                                              controller.cart.removeAt(i),
                                          icon: const Icon(
                                            Icons.delete_rounded,
                                            color: primaryOrange,
                                            size: 40,
                                          )),
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
                text: 'Finalizar Pedido Atual',
                onPressed: () {
                  controller.orders.value = controller.cart;
                  // Get.to(() => const OrderPage()); levar para cozinha
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actions: [
                          Center(
                              child: TextButton(
                                  onPressed: () {
                                    Get.close(1);
                                  },
                                  child: const Text('Ok')))
                        ],
                        title: const Text('Revisão de pedido'),
                        content: const Text(
                            'Aproveite para revisar observações dos pratos e o pedido antes de ser enviado a cozinha!'),
                      );
                    },
                  );
                },
                isActive: controller.cart.isNotEmpty),
          ),
        ],
      )),
    );
  }
}
