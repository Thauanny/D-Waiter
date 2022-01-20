import 'dart:convert';

class Food {
  String name;
  List<dynamic> imageUrls;
  double price;
  int id;
  String? note;
  int quantity;
  DateTime? orderAt;

  Food(
      {required this.name,
      required this.imageUrls,
      required this.price,
      required this.id,
      required this.quantity});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrls,
      'price': price,
      'id': id,
      'quantity': quantity
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] ?? '',
      imageUrls: (map['image'] ?? ['', '']),
      price: map['price'] ?? '',
      id: int.parse(map['id'] ?? '0'),
      quantity: map['quantity'] ?? 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));
}
