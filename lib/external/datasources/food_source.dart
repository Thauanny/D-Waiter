import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../domain/features/entities/food.dart';
import '../../infra/datasources/errors/ifoodsource_error.dart';
import '../../infra/datasources/ifoodsource.dart';
import '../errors/food_empty_error.dart';
import '../errors/food_null_error.dart';

class FoodSourceImpl implements IFoodSource {
  final String _url = 'http://10.0.2.2:8080';
  Client client = Client();

  @override
  Future<Either<List<Food>, IFoodSourceError>> fetchFoods() async {
    var response = await client.get(
      Uri.parse('$_url/foods'),
    );

    if (response.statusCode == 200) {
      try {
        List<dynamic> jsonBody = jsonDecode(response.body);
        List<Food> foods = [];

        for (var element in jsonBody) {
          foods.add(Food.fromMap(element));
        }

        return Left(foods);
      } catch (e) {
        return Right(FoodEmptyError());
      }
    } else {
      throw response;
    }
  }

  @override
  Future<Either<List<Food>, IFoodSourceError>> searchFood(String name) async {
    if (name.isNotEmpty) {
      var response = await client.get(
        Uri.parse('$_url/foods/food/$name'),
      );

      if (response.statusCode == 200) {
        try {
          List<dynamic> jsonBody = jsonDecode(response.body);
          List<Food> foods = [];

          for (var element in jsonBody) {
            foods.add(Food.fromMap(element));
          }

          return Left(foods);
        } catch (e) {
          return Right(FoodEmptyError());
        }
      } else {
        throw response;
      }
    } else {
      return Right(FoodEmptyError());
    }
  }

  @override
  Future<Either<Food, IFoodSourceError>> fetchFoodById(int id) async {
    var response = await client.get(
      Uri.parse('$_url/foods/$id'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = Map.from(jsonDecode(response.body));
      try {
        if (jsonBody.values.first == null) {
          return Right(FoodNullError());
        } else {
          return Left(Food.fromMap(jsonBody));
        }
      } catch (e) {
        return Right(FoodEmptyError());
      }
    } else {
      throw response;
    }
  }

  @override
  Future<Either<List<Food>, IFoodSourceError>> fetchDrink() async {
    var response = await client.get(
      Uri.parse('$_url/drinks'),
    );

    if (response.statusCode == 200) {
      try {
        List<dynamic> jsonBody = jsonDecode(response.body);
        List<Food> foods = [];

        for (var element in jsonBody) {
          foods.add(Food.fromMap(element));
        }

        return Left(foods);
      } catch (e) {
        return Right(FoodEmptyError());
      }
    } else {
      throw response;
    }
  }

  @override
  Future<Either<List<Food>, IFoodSourceError>> searchDrink(String name) async {
    var response = await client.get(
      Uri.parse('$_url/drinks/drink/$name'),
    );

    if (response.statusCode == 200) {
      Map<dynamic, dynamic> jsonBody = Map.from(jsonDecode(response.body));
      try {
        if (jsonBody.values.first == null) {
          return Right(FoodNullError());
        } else {
          List<Food> foods = [];

          jsonBody.values.first.forEach((element) {
            foods.add(Food.fromMap(element));
          });

          return Left(foods);
        }
      } catch (e) {
        return Right(FoodEmptyError());
      }
    } else {
      throw response;
    }
  }

  @override
  Future<Either<Food, IFoodSourceError>> fetchDrinkById(int id) async {
    var response = await client.get(
      Uri.parse('$_url/drinks/$id'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = Map.from(jsonDecode(response.body));
      try {
        if (jsonBody.values.first == null) {
          return Right(FoodNullError());
        } else {
          return Left(Food.fromMap(jsonBody));
        }
      } catch (e) {
        return Right(FoodEmptyError());
      }
    } else {
      throw response;
    }
  }
}
