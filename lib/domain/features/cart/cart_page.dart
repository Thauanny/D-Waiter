import 'package:d_waiter/domain/features/entities/food.dart';
import 'package:d_waiter/domain/features/in_preparation/in_preparation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

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
      body: Obx(() => Column(
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
                          Get.close(0);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                        color: primaryOrange,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 2),
                      child: const Text(
                        'Cart',
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
                            children: [
                              const Icon(
                                Icons.shopping_cart_rounded,
                                size: 150,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                child: Text(
                                  'no-orders-text'.i18n(),
                                  style: const TextStyle(
                                      fontSize: 50, color: Colors.grey),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : ListView(
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
                                          _selectItensOption(
                                              food: controller.cart[i],
                                              index: i)
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          );
                        }, growable: true),
                      ),
              ),
              controller.cart.isEmpty
                  ? Container()
                  : SizedBox(
                      width: 300,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Estimativa de tempo',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: primaryOrange),
                          ),
                          Text(
                            '20:00 min',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: primaryOrange),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: PrimaryButton(
                    text: 'Finalizar Pedido Atual',
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
                                  child: const Text(
                                    'Revisar',
                                    style: TextStyle(color: primaryOrange),
                                  ),
                                ),
                              ),
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    Get.close(1);
                                    Get.off(() => InPreparationPage(
                                          controller: controller,
                                        ));
                                    for (Food element in controller.cart) {
                                      controller.orders.add(element);
                                    }
                                  },
                                  child: const Text(
                                    'Enviar',
                                    style: TextStyle(color: primaryOrange),
                                  ),
                                ),
                              )
                            ],
                            title: const Text(
                              'Revisão de pedido',
                              style: TextStyle(color: primaryOrange),
                            ),
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
              onPressed: () {
                controller.cart.elementAt(index).quantity = 1;
                controller.cart.removeAt(index);
              },
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
                                child: Text(
                                  'save-text'.i18n(),
                                  style: const TextStyle(
                                    color: primaryOrange,
                                    fontSize: 20,
                                  ),
                                )))
                      ],
                      title: Text('order-information-text'.i18n()),
                      content: SizedBox(
                        height: MediaQuery.of(context).size.height - 300,
                        width: MediaQuery.of(context).size.width - 300,
                        child: ListView.builder(
                          itemCount: controller.cart.length,
                          itemBuilder: (
                            context,
                            index,
                          ) =>
                              Column(children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(200),
                                  child: Image.network(
                                    controller.cart
                                        .elementAt(index)
                                        .imageUrls
                                        .first,
                                    fit: BoxFit.fill,
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  controller.cart.elementAt(index).name,
                                  style: const TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              'order-notes-label-text'.i18n(),
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              onChanged: (value) {
                                controller.cart.elementAt(index).note = value;
                              },
                              decoration: InputDecoration(
                                hintText:
                                    controller.cart.elementAt(index).note ?? '',
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryOrange),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ]),
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

  Widget _selectItensOption({required Food food, required int index}) {
    controller.foodQuantity.value = food.quantity;
    return Align(
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
                onPressed: () {
                  if (food.quantity > 1) {
                    food.quantity--;
                    controller.foodQuantity.value--;
                  } else {
                    controller.cart.removeAt(index);
                    food.quantity = 1;
                  }
                },
                icon: const Icon(Icons.remove),
                color: Colors.white,
                iconSize: 20,
              ),
              Text(
                controller.foodQuantity.value.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  food.quantity++;
                  controller.foodQuantity.value++;
                },
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
}
