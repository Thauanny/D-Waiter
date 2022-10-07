import 'package:d_waiter/domain/entities/order.dart';
import 'package:d_waiter/domain/services/ikitchen_service.dart';
import 'package:get/get.dart';

import '../../../services/ifood_service.dart';
import '../../entities/food.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxList foodList = <Food>[].obs;
  RxList drinksList = <Food>[].obs;

  RxString searchText = ''.obs;

  RxList<Food> cart = <Food>[].obs;
  RxList<Food> orders = <Food>[].obs;
  RxList<Order> ordersReady = <Order>[].obs;
  IFoodService foodService;
  IKitchenService kitchenService;

  RxInt foodQuantity = 1.obs;

  HomeController(this.foodService, this.kitchenService) {
    fetchFood();
    fetchDrink();
    kitchenService.getOrdersReady().listen((event) {
      ordersReady.add(event);
    });
  }

  void sendOrder(Order order) {
    kitchenService.send(order);
  }

  Future<void> fetchFood() async {
    isLoading.value = true;
    var foods = await foodService.fetchFoods();
    foods.fold((l) => foodList.value = l, (r) => foodList.value = []);
    foodList.refresh();

    isLoading.value = false;
  }

  Future<void> fetchSearchFood() async {
    isLoading.value = true;
    if (searchText.value.isNotEmpty) {
      var foods = await foodService.searchFood(searchText.value);
      foods.fold((l) => foodList.value = l, (r) => foodList.value = <Food>[]);
      isLoading.value = false;
    } else {
      fetchFood();
    }
  }

  Future<void> fetchDrink() async {
    isLoading.value = true;
    var foods = await foodService.fetchDrinks();
    foods.fold((l) => drinksList.value = l, (r) => drinksList.value = []);
    isLoading.value = false;
  }

  Future<void> fetchDrinkFood() async {
    isLoading.value = true;
    var foods = await foodService.searchDrink(searchText.value);
    foods.fold((l) => drinksList.value = l, (r) => drinksList.value = []);
    isLoading.value = false;
  }
}
