import 'package:d_waiter/domain/models/food.dart';
import 'package:d_waiter/infra/service/food_service.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  var isLoading = true.obs;
  var foodList = <Food>[].obs;

  var foodDetails = ''.obs;

  var searchText = ''.obs;

  var cart = <Food>[].obs;
  var orders = <Food>[].obs;

  @override
  void onInit() {
    fetchFood();
    super.onInit();
  }

  void fetchFood() async {
    try {
      isLoading(true);
      var foods = await FoodService.fetchFood();
      foodList.value = foods;
    } finally {
      isLoading(false);
    }
  }

  void fetchSearchFood() async {
    try {
      isLoading(true);
      var foods =
          await FoodService.fetchSearchFood(searchText: searchText.value);
      foodList.value = foods;
    } finally {
      isLoading(false);
    }
  }

  void fetchDetailsOfAFood(String id) async {
    try {
      var foodDetailsResponse = await FoodService.fetchDetailsOfAFood(id: id);
      foodDetails.value = foodDetailsResponse;
    } finally {
      isLoading(false);
    }
  }
}
