import 'package:d_waiter/domain/features/home/controllers/home_controller.dart';
import 'package:d_waiter/domain/features/home/presenters/home/components/foodList_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:localization/localization.dart';

import '../../../../../../design_system/colors.dart';
import '../../seeMore/see_more_page.dart';

class FoodsTabComponent extends StatelessWidget {
  const FoodsTabComponent(
      {super.key,
      required this.verify,
      required this.list,
      required this.controller});
  final bool verify;
  final RxList list;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const SizedBox(
        height: 20,
      ),
      FoodListComponent(controller: controller, verify: verify, list: list),
      Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 40),
        child: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              controller.foodList.isEmpty
                  ? () {}
                  : Get.to(() => SeeMorePage(
                        controller: controller,
                      ));
            },
            child: Obx(
              () => Text(
                'see-more-text'.i18n(),
                style: TextStyle(
                    color: controller.foodList.isEmpty
                        ? Colors.grey
                        : primaryOrange,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
