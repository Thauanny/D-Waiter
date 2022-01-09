import 'dart:convert';

import 'package:d_waiter/domain/models/food.dart';
import 'package:http/http.dart' as http;

class FoodRepository {
  static var client = http.Client();
  static Future<List<Food>> fetchFood() async {
    var response = await client.get(
      Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken_breast'),
    );

    if (response.statusCode == 200) {
      var responseBody = response.body;

      Map<String, dynamic> jsonBody = jsonDecode(responseBody);

      var foodList = <Food>[];

      jsonBody.values.first.forEach((element) {
        foodList.add(Food.fromMap(element));
      });

      return foodList;
    } else {
      //show error
      return <Food>[];
    }
  }

  static Future<List<Food>> fetchSearchFood(
      {required String searchText}) async {
    var response = await client.get(
      Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/search.php?s=${searchText}'),
    );

    if (response.statusCode == 200) {
      var responseBody = response.body;

      Map<String, dynamic> jsonBody = jsonDecode(responseBody);

      var foodList = <Food>[];

      jsonBody.values.first.forEach((element) {
        foodList.add(Food.fromMap(element));
      });

      return foodList;
    } else {
      //show error
      return <Food>[];
    }
  }

  static Future<String> fetchDetailsOfAFood({required String id}) async {
    var response = await client.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=${id}'),
    );

    if (response.statusCode == 200) {
      var responseBody = response.body;

      Map<String, dynamic> jsonBody = jsonDecode(responseBody);

      var details = Map.from(jsonBody.values.first[0]);

      return details['strInstructions'];
    } else {
      //show error
      return 'Not Found';
    }
  }
}
