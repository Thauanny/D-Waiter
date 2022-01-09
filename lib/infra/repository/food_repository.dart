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
}
