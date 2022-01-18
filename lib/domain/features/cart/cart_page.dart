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
      resizeToAvoidBottomInset: false,
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
                                  style: TextStyle(
                                      fontSize: 50, color: Colors.grey),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : Column(
                        children: List.generate(controller.cart.length, (i) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 50),
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
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 50.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          _removeOption(index: i),
                                          _obsOption(
                                              index: i, context: context),
                                          _selectItensOption()
                                        ],
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

  Widget _removeOption({required int index}) => Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 55.0),
          child: IconButton(
              onPressed: () => controller.cart.removeAt(index),
              icon: const Icon(
                Icons.delete_rounded,
                color: primaryOrange,
                size: 40,
              )),
        ),
      );

  Widget _obsOption({required int index, required BuildContext context}) =>
      Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 55.0),
          child: IconButton(
              onPressed: () {
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
                      title: const Text('Observação do pedido'),
                      content: TextField(
                        onChanged: (value) {
                          controller.cart.elementAt(index).note = value;
                        },
                        decoration: InputDecoration(
                          hintText: controller.cart.elementAt(index).note ?? '',
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryOrange),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(
                controller.cart.elementAt(index).note == null
                    ? Icons.message_outlined
                    : Icons.message,
                color: primaryOrange,
                size: 40,
              )),
        ),
      );

  Widget _selectItensOption() => Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 20.0),
          child: Container(
            decoration: const BoxDecoration(
              color: primaryOrange,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            height: 40,
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove),
                  color: Colors.white,
                  iconSize: 20,
                ),
                Text(
                  '0',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                  iconSize: 20,
                ),
              ],
            ),
          ),
        ),
      );
}
