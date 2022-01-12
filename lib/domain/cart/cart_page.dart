import 'package:d_waiter/controllers/food_controller.dart';
import 'package:d_waiter/domain/orders/orders_page.dart';
import 'package:d_waiter/shared/colors.dart';
import 'package:d_waiter/shared/components/food_card.dart';
import 'package:d_waiter/shared/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final FoodController _foodController = Get.put(FoodController());

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Obx(
              () => _foodController.cart.isEmpty
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
                      children: List.generate(_foodController.cart.length, (i) {
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
                                  FoodCard(
                                      context, _foodController.cart[i], false),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, right: 20.0),
                                      child: IconButton(
                                          onPressed: () {
                                            _foodController.cart.removeAt(i);
                                          },
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
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PrimaryButton(context, 'Finalizar Pedido Atual', () {
              _foodController.orders.value = List.from(_foodController.cart);
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
                              child: Text('Ok')))
                    ],
                    title: Text('Revisão de pedido'),
                    content: Text(
                        'Aproveite para revisar observações dos pratos e o pedido antes de ser enviado a cozinha!'),
                  );
                },
              );
            }, _foodController.cart.isNotEmpty),
          ),
        ],
      ),
    );
  }
}
