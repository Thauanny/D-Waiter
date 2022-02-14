import 'dart:convert';

import '../features/entities/food.dart';

enum OrderType { fast, slow }

extension Name on OrderType {
  String name() {
    switch (this) {
      case OrderType.fast:
        return 'rabbit';
      case OrderType.slow:
        return 'snail';
      default:
        throw UnimplementedError();
    }
  }
}

class Order {
  int? id;

  String table;

  final OrderType type;
  List<Food> foods;

  Order({
    this.id,
    required this.table,
    required this.foods,
    required this.type,
  });

  factory Order.fromMap(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      table: json['table']!,
      foods: json['foods']!,
      type: OrderType.values[json['foods']!],
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
