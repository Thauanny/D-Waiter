import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/features/entities/food.dart';
import '../../domain/features/home/controllers/home_controller.dart';
import '../../domain/features/item/item_page.dart';
import '../colors.dart';

class VerticalFoodCard extends StatelessWidget {
  const VerticalFoodCard(
      {super.key, required this.controller, required this.food});
  final HomeController controller;
  final Food food;

  @override
  Widget build(BuildContext context) {
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
                  for (Food element in controller.cart) {
                    if (element.id == food.id) {
                      food.quantity++;
                      exist = true;
                    }
                  }
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
            height: 250,
            width: 180,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40.0,
              ),
              child: _contentCard(food, context),
            ),
          ),
          Container(
              height: 170,
              width: 170,
              color: Colors.transparent,
              child: _imageCard(food))
        ],
      ),
    );
  }
}

Widget _contentCard(Food food, BuildContext context) => Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _nameLabel(food),
          const SizedBox(
            height: 20,
          ),
          _priceLabel(food),
          const SizedBox(
            height: 10,
          ),
          const Icon(
            Icons.search,
            color: primaryOrange,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      shadowColor: Colors.transparent,
    );

Widget _imageCard(Food food) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 10,
          color: Colors.grey.withOpacity(0.1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              food.imageUrls.first,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );

Widget _nameLabel(
  Food food,
) =>
    Center(
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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );

Widget _priceLabel(
  Food food,
) =>
    SizedBox(
      width: 200,
      child: Text(
        r'R$ ' + food.price.toString(),
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: primaryOrange, fontWeight: FontWeight.bold, fontSize: 20),
        maxLines: 2,
      ),
    );
