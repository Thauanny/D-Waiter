import 'package:d_waiter/domain/models/food.dart';
import 'package:d_waiter/infra/repository/food_repository.dart';

class FoodService {
  static Future<List<Food>> fetchFood() async {
    return FoodRepository.fetchFood();
  }
}
