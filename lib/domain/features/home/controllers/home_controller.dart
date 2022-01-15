import 'package:get/get.dart';

import '../../../services/ifood_service.dart';
import '../../entities/food.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxList foodList = <Food>[].obs;

  RxString searchText = ''.obs;

  RxList cart = <Food>[].obs;
  RxList orders = <Food>[].obs;
  IFoodService foodService;

  HomeController(this.foodService) {
    fetchFood();
  }

  Future<void> fetchFood() async {
    isLoading.value = true;
    var foods = await foodService.fetchFoods();
    foods.fold((l) => foodList.value = l, (r) => foodList.value = []);
    isLoading.value = false;
  }

  Future<void> fetchSearchFood() async {
    isLoading.value = true;
    var foods = await foodService.searchFood(searchText.value);
    foods.fold((l) => foodList.value = l, (r) => foodList.value = []);
    isLoading.value = false;
  }
}
