import 'package:d_waiter/design_system/colors.dart';
import 'package:d_waiter/design_system/components/food_card.dart';
import 'package:d_waiter/domain/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

class SeeMorePage extends StatefulWidget {
  final HomeController controller;

  const SeeMorePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<SeeMorePage> createState() => _SeeMorePageState();
}

class _SeeMorePageState extends State<SeeMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: primaryOrange,
        backgroundColor: primaryWhite,
        elevation: 0,
        title: Text(
          'foods-label-text'.i18n(),
          style: const TextStyle(
              color: primaryOrange, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: primaryWhite,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: GridView.count(
                      childAspectRatio: 40 / 50,
                      crossAxisCount: 2,
                      children:
                          List.generate(widget.controller.foodList.length, (i) {
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
                                widget.controller,
                                widget.controller.foodList[i],
                                true,
                              )),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
