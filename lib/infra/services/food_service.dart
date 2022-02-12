import 'package:d_waiter/infra/datasources/errors/ifoodsource_error.dart';
import 'package:dartz/dartz.dart';

import '../../domain/features/entities/food.dart';
import '../../domain/services/ifood_service.dart';
import '../datasources/ifoodsource.dart';

class FoodService implements IFoodService {
  IFoodSource foodSource;

  FoodService(this.foodSource);

  @override
  Future<Either<Food, IFoodSourceError>> fetchFoodById(int id) {
    return foodSource.fetchFoodById(id);
  }

  @override
  Future<Either<List<Food>, IFoodSourceError>> fetchFoods() {
    return foodSource.fetchFoods();
  }

  @override
  Future<Either<List<Food>, IFoodSourceError>> searchFood(String name) {
    return foodSource.searchFood(name);
  }

  @override
  Future<Either<Food, IFoodSourceError>> fetchDrinkById(int id) {
    return foodSource.fetchDrinkById(id);
  }

  @override
  Future<Either<List<Food>, IFoodSourceError>> fetchDrinks() {
    return foodSource.fetchDrink();
  }

  @override
  Future<Either<List<Food>, IFoodSourceError>> searchDrink(String name) {
    return foodSource.searchDrink(name);
  }
}
