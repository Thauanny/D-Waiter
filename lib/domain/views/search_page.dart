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
      appBar: AppBar(
        foregroundColor: primaryOrange,
        backgroundColor: primaryWhite,
        elevation: 0,
        title: const Text(
          'Comidas',
          style: TextStyle(
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
                      childAspectRatio: 130 / 200,
                      crossAxisCount: 2,
                      children:
                          List.generate(_foodController.foodList.length, (i) {
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
                                  context, _foodController.foodList[i], false)),
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
