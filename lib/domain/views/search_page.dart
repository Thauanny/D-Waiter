import 'package:d_waiter/controllers/food_controller.dart';
import 'package:d_waiter/shared/colors.dart';
import 'package:d_waiter/shared/components/food_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final FoodController _foodController = Get.put(FoodController());

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondwhite,
      body: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 5,
            child: Obx(
              () => GridView.count(
                childAspectRatio: 130 / 200,
                crossAxisCount: 2,
                children: List.generate(_foodController.foodList.length, (i) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child:
                        foodCard(context, _foodController.foodList[i], false),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
