import 'package:d_waiter/controllers/food_controller.dart';
import 'package:d_waiter/shared/colors.dart';
import 'package:d_waiter/shared/components/food_card.dart';
import 'package:d_waiter/shared/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final FoodController _foodController = Get.put(FoodController());

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = (MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'Orders',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: primaryOrange,
      ),
      body: Column(
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
                              Icons.my_library_books_rounded,
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
                  : Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: GridView.count(
                        childAspectRatio: 40 / 50,
                        crossAxisCount: 2,
                        children:
                            List.generate(_foodController.orders.length, (i) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                shadowColor: Colors.grey.withOpacity(0.3),
                                color: Colors.transparent,
                                elevation: 40,
                                child: FoodCard(
                                    context, _foodController.orders[i], false)),
                          );
                        }),
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PrimaryButton(
                context,
                'Finalizar atendimento e realizar pagamento',
                () {},
                _foodController.cart.isNotEmpty),
          ),
        ],
      ),
    );
  }
}
