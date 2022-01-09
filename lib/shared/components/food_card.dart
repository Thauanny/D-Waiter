import 'package:d_waiter/controllers/food_controller.dart';
import 'package:d_waiter/domain/models/food.dart';
import 'package:d_waiter/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final FoodController _foodController = Get.put(FoodController());
Widget foodCard(BuildContext context) {
  return Obx(
    () => _foodController.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(
              color: primaryOrange,
            ),
          )
        : SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _foodController.foodList.length,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: _itensFoods(_foodController.foodList[i]),
              ),
            ),
          ),
  );
}

Widget _itensFoods(Food food) => Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Container(
            height: 650,
            color: primaryWhite,
            width: 230,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              shadowColor: Colors.grey.withOpacity(0.3),
              elevation: 5,
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 30,
          color: Colors.grey.withOpacity(0.1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image.network(
              food.imageUrl,
              height: 170,
              width: 170,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Center(
            child: SizedBox(
                width: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        food.name,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        maxLines: 2,
                      ),
                    ),
                  ],
                )),
          ),
        )
      ],
    );
