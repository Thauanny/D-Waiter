import 'dart:convert';

List<Food> foodFromJsonToList(String string) => List<Food>.from(
      json.decode(string).map(
            (e) => Food.fromJson(e),
          ),
    );

class Food {
  String name;
  List<dynamic> imageUrls;
  double price;
  int id;

  Food({
    required this.name,
    required this.imageUrls,
    required this.price,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrls,
      'price': price,
      'id': id,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] ?? '',
      imageUrls: (map['image'] ?? ['', '']),
      price: map['price'] ?? '',
      id: int.parse(map['id'] ?? '0'),
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));
}
