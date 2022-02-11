import 'package:d_waiter/design_system/colors.dart';
import 'package:d_waiter/design_system/components/primary_button.dart';
import 'package:d_waiter/domain/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatefulWidget {
  final HomeController controller;

  const CheckoutPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool _checkedPaypal = false;
  bool _checkedPix = false;
  bool _checkedPicPay = false;

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in widget.controller.orders) {
      total += item.price;
    }
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 100.0, bottom: 50),
                    child: Text(
                      'Payment',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 100.0, bottom: 25),
                    child: Text(
                      'Table Number',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width - 400,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Divider(
                            color: Colors.grey,
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              '4',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 100.0, bottom: 25, top: 25),
                    child: Text(
                      'Payment Method',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 400,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _checkedPaypal,
                              onChanged: (value) {
                                setState(() {
                                  _checkedPaypal = value!;
                                });
                              },
                              activeColor: primaryOrange,
                            ),
                            _paymentMethod(
                              payment: 'paypal',
                              checked: _checkedPaypal,
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                          height: 5,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _checkedPix,
                              onChanged: (value) {
                                setState(() {
                                  _checkedPix = value!;
                                });
                              },
                              activeColor: primaryOrange,
                            ),
                            _paymentMethod(
                                payment: 'pix', checked: _checkedPix),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                          height: 5,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _checkedPicPay,
                              onChanged: (value) {
                                setState(() {
                                  _checkedPicPay = value!;
                                });
                              },
                              activeColor: primaryOrange,
                            ),
                            _paymentMethod(
                                payment: 'picpay', checked: _checkedPicPay),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 200,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                        color: primaryOrange,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    total.toString(),
                    style: const TextStyle(
                        color: primaryOrange,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PrimaryButton(
                text: 'Complete Order',
                onPressed: () {},
                isActive: widget.controller.orders.isNotEmpty),
          ),
        ],
      ),
    );
  }

  Widget _paymentMethod({
    required String payment,
    required bool checked,
  }) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: primaryOrange),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                'assets/icons/$payment.svg',
                semanticsLabel: '${payment}_icon',
                height: 5,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Text(
          payment.capitalizeFirst!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
