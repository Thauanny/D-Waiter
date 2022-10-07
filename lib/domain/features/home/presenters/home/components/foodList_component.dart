import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import '../../../../../../design_system/colors.dart';
import '../../../../../../design_system/components/food_card.dart';
import '../../../controllers/home_controller.dart';

class FoodListComponent extends StatelessWidget {
  const FoodListComponent(
      {super.key,
      required this.controller,
      required this.verify,
      required this.list});
  final bool verify;
  final RxList list;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryOrange,
              ),
            )
          : verify
              ? Column(
                  children: [
                    const Icon(
                      Icons.search,
                      size: 70,
                      color: Colors.grey,
                    ),
                    Text(
                      'item-not-found-text'.i18n(),
                      style: const TextStyle(fontSize: 30, color: Colors.grey),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.foodList.length < 5
                          ? controller.foodList.length
                          : 5,
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: FoodCard(context, controller, list[i]),
                      ),
                    ),
                  ),
                ),
    );
  }
}
