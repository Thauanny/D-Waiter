import 'package:d_waiter/infra/services/kitchen_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/external/datasources/food_source.dart';
import 'domain/app.dart';
import 'infra/services/food_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(FoodService(FoodSourceImpl()));
  Get.put(KitchenService()..init());
  runApp(const MyApp());
}
