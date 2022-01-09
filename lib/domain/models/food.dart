import 'dart:convert';

import 'dart:math';

List<Food> foodFromJsonToList(String string) => List<Food>.from(
      json.decode(string).map(
            (e) => Food.fromJson(e),
          ),
    );

class Food {
  String name;
  String imageUrl;
  String price;
  int id;
  Food({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'id': id,
    };
  }

  factory Food.fromMap(Map<dynamic, dynamic> map) {
    return Food(
      name: map['strMeal'] ?? '',
      imageUrl: map['strMealThumb'] ?? '',
      price: Random().nextInt(50).toString() +
          ',' +
          Random().nextInt(50).toString(),
      id: int.parse(map['idMeal']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));
}
