import 'package:d_waiter/design_system/components/vertical_food_card.dart';
import 'package:flutter/material.dart';

import '../../domain/features/entities/food.dart';
import '../../domain/features/home/controllers/home_controller.dart';

import 'horizontal_food_card.dart';

Widget FoodCard(BuildContext context, HomeController controller, Food food,
    [isCardVertical = true]) {
  return isCardVertical
      ? VerticalFoodCard(controller: controller, food: food)
      : HorizontalFoodCard(controller: controller, food: food);
}
