import 'package:d_waiter/design_system/colors.dart';
import 'package:d_waiter/design_system/components/food_card.dart';
import 'package:d_waiter/design_system/components/primary_button.dart';
import 'package:d_waiter/domain/features/home/controllers/home_controller.dart';
import 'package:d_waiter/domain/features/home/presenters/home_page.dart';
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
                      Get.off(() => HomePage());
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
                : Column(
                    children: List.generate(controller.cart.length, (i) {
                      return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          shadowColor: Colors.grey.withOpacity(0.3),
                          color: Colors.transparent,
                          elevation: 40,
                          child: Stack(
                            children: [
                              foodCard(context, controller, controller.cart[i],
                                  false),
                            ],
                          ));
                    }),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PrimaryButton(
                text: 'Finalizar atendimento e realizar pagamento',
                onPressed: () {},
                isActive: controller.cart.isNotEmpty),
          ),
        ],
      ),
    );
  }
}
