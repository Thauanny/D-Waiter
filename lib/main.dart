import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/external/datasources/food_source.dart';
import 'domain/app.dart';
import 'infra/services/food_service.dart';

void main() {
  Get.put(FoodServiceImpl(FoodSourceImpl()));
  runApp(const MyApp());
}
