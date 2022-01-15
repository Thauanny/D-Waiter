import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/features/entities/food.dart';
import '../../domain/features/home/controllers/home_controller.dart';
import '../../domain/features/item/item_page.dart';
import '../colors.dart';

Widget foodCard(BuildContext context, HomeController controller, Food food,
    [isHorizontal = true]) {
  return InkWell(
    onTap: () {
      Get.to(() => ItemPage(
            food: food,
            onCartPressed: () {
              controller.cart.add(food);
            },
          ));
    },
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
            height: isHorizontal ? 355 : 400,
            color: isHorizontal ? primaryWhite : Colors.transparent,
            width: isHorizontal ? 250 : 350,
            child: _contentCard(isHorizontal, food)),
      ],
    ),
  );
}

Widget _contentCard(bool isHorizontal, Food food) => Card(
      child: Column(
        children: [
          _imageCard(food, isHorizontal),
          _nameLabel(food, isHorizontal),
          const SizedBox(
            height: 30,
          ),
          _priceLabel(food, isHorizontal)
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      shadowColor:
          isHorizontal ? Colors.grey.withOpacity(0.3) : Colors.transparent,
      elevation: isHorizontal ? 5 : 0,
    );

Widget _imageCard(Food food, bool isHorizontal) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      elevation: 30,
      color: Colors.grey.withOpacity(0.1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Image.network(
          food.imageUrls.first,
          height: isHorizontal ? 150 : 150,
          width: isHorizontal ? 150 : 150,
          fit: BoxFit.fill,
        ),
      ),
    );

Widget _nameLabel(Food food, bool isHorizontal) => Padding(
      padding: EdgeInsets.only(top: isHorizontal ? 50.0 : 25),
      child: Center(
        child: SizedBox(
          width: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  food.name,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isHorizontal ? 20 : 28),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget _priceLabel(Food food, bool isHorizontal) => Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                r'R$ ' + food.price.toString(),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: primaryOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: isHorizontal ? 20 : 28),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );