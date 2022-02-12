import 'dart:convert';

import '../features/entities/food.dart';

class Order {
  int? id;

  String table;

  List<Food> foods;

  Order({
    this.id,
    required this.table,
    required this.foods,
  });

  factory Order.fromMap(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      table: json['table'],
      foods: json['foods'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'table': table,
      'foods': foods,
    };
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
