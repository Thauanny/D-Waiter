import 'package:dartz/dartz.dart';

import '../../domain/features/entities/food.dart';
import 'errors/ifoodsource_error.dart';

abstract class IFoodSource {
  Future<Either<List<Food>, IFoodSourceError>> fetchFoods();

  Future<Either<List<Food>, IFoodSourceError>> searchFood(String name);

  Future<Either<Food, IFoodSourceError>> fetchFoodById(int id);
}
