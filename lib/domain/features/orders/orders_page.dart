import 'package:d_waiter/design_system/colors.dart';
import 'package:d_waiter/design_system/components/food_card.dart';
import 'package:d_waiter/design_system/components/primary_button.dart';
import 'package:d_waiter/domain/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final HomeController controller;

  const OrderPage({Key? key, required this.controller}) : super(key: key);

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
            child: controller.cart.isEmpty
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
                      children: List.generate(controller.orders.length, (i) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              shadowColor: Colors.grey.withOpacity(0.3),
                              color: Colors.transparent,
                              elevation: 40,
                              child: foodCard(
                                context,
                                controller,
                                controller.orders[i],
                                false,
                              )),
                        );
                      }),
                    ),
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
