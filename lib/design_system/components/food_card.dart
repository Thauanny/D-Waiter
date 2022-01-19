import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/features/entities/food.dart';
import '../../domain/features/home/controllers/home_controller.dart';
import '../../domain/features/item/item_page.dart';
import '../colors.dart';

Widget foodCard(BuildContext context, HomeController controller, Food food,
    [isCardVertical = true]) {
  return InkWell(
    onTap: () {
      Get.to(() => ItemPage(
            food: food,
            onCartPressed: () {
              if (controller.cart.isNotEmpty &&
                  food.id == controller.cart.last.id) {
                food.quantity++;
              } else {
                var exist = false;
                controller.cart.value.forEach((element) {
                  if (element.id == food.id) {
                    food.quantity++;
                    exist = true;
                  }
                });
                if (!exist) {
                  controller.cart.add(food);
                }
              }
            },
          ));
    },
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: isCardVertical ? 355 : 220,
          width: isCardVertical ? 250 : MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(
                top: isCardVertical ? 50.0 : 0, right: isCardVertical ? 0 : 40),
            child: _contentCard(isCardVertical, food, context),
          ),
        ),
        isCardVertical
            ? Container(
                height: isCardVertical ? 170 : 135,
                width: isCardVertical ? 170 : 135,
                color: Colors.transparent,
                child: _imageCard(food, isCardVertical))
            : Container()
      ],
    ),
  );
}

Widget _contentCard(bool isHorizontal, Food food, BuildContext context) => Card(
      child: isHorizontal
          ? Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                _nameLabel(food, isHorizontal),
                const SizedBox(
                  height: 30,
                ),
                _priceLabel(food, isHorizontal)
              ],
            )
          : Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: _imageCard(food, isHorizontal),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _nameLabel(food, isHorizontal),
                    const SizedBox(
                      height: 20,
                    ),
                    _priceLabel(food, isHorizontal)
                  ],
                ),
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
          fit: BoxFit.fill,
        ),
      ),
    );

Widget _nameLabel(Food food, bool isHorizontal) => Padding(
      padding: EdgeInsets.only(
          top: isHorizontal ? 50.0 : 25, left: isHorizontal ? 0 : 50),
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
