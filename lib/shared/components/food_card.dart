import 'package:d_waiter/controllers/food_controller.dart';
import 'package:d_waiter/domain/models/food.dart';
import 'package:d_waiter/domain/views/item_page.dart';
import 'package:d_waiter/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget foodCard(BuildContext context, Food food, [isHorizontal = true]) {
  return InkWell(
    onTap: () {
      Get.to(() => ItemPage(food));
    },
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(top: isHorizontal ? 50.0 : 25),
          child: Container(
              height: isHorizontal ? 650 : 250,
              color: isHorizontal ? primaryWhite : Colors.transparent,
              width: isHorizontal ? 230 : 150,
              child: _contentCard(isHorizontal)),
        ),
        _imageCard(food, isHorizontal),
        _nameLabe(food, isHorizontal),
        _priceLabel(food, isHorizontal)
      ],
    ),
  );
}

Widget _contentCard(bool isHorizontal) => Card(
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
          food.imageUrl,
          height: isHorizontal ? 170 : 100,
          width: isHorizontal ? 170 : 100,
          fit: BoxFit.fill,
        ),
      ),
    );

Widget _nameLabe(Food food, bool isHorizontal) => Padding(
      padding: EdgeInsets.only(top: isHorizontal ? 100.0 : 25),
      child: Center(
        child: SizedBox(
          width: isHorizontal ? 200 : 100,
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
                      fontSize: isHorizontal ? 20 : 15),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget _priceLabel(Food food, bool isHorizontal) => Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  r'R$ ' + food.price,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: primaryOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: isHorizontal ? 20 : 15),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
