import 'package:d_waiter/domain/models/food.dart';
import 'package:d_waiter/infra/service/food_service.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  var isLoading = true.obs;
  var foodList = <Food>[].obs;

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
}
