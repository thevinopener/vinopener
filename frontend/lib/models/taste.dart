// lib/models/taste.dart
class Taste {
  final int id;
  final String name;

  Taste({required this.id, required this.name});

  factory Taste.fromJson(Map<String, dynamic> json) {
    return Taste(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
