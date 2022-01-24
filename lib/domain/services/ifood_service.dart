import 'package:dartz/dartz.dart';

import '../../infra/datasources/errors/ifoodsource_error.dart';
import '../features/entities/food.dart';

abstract class IFoodService {
  Future<Either<List<Food>, IFoodSourceError>> fetchFoods();

  Future<Either<List<Food>, IFoodSourceError>> searchFood(String name);

  Future<Either<Food, IFoodSourceError>> fetchFoodById(int id);

  Future<Either<List<Food>, IFoodSourceError>> fetchDrinks();

  Future<Either<List<Food>, IFoodSourceError>> searchDrink(String name);

  Future<Either<Food, IFoodSourceError>> fetchDrinkById(int id);
}
