// lib/model/wine.dart
class Wine {
  final int id;
  final String name;
  final String seoName;
  final String imageUrl;
  final String grape;
  final String winery;
  final String country;
  final double price;
  final double rating;
  final int vintage;
  final String type;
  final double acidity;
  final double intensity;
  final double sweetness;
  final double tannin;
  final double abv;

  Wine({
    required this.id,
    required this.name,
    required this.seoName,
    required this.imageUrl,
    required this.grape,
    required this.winery,
    required this.country,
    required this.price,
    required this.rating,
    required this.vintage,
    required this.type,
    required this.acidity,
    required this.intensity,
    required this.sweetness,
    required this.tannin,
    required this.abv,
  });

  // JSON 데이터를 객체로 변환
  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
      id: json['id'],
      name: json['name'],
      seoName: json['seoName'],
      imageUrl: json['imageUrl'],
      grape: json['grape'],
      winery: json['winery'],
      country: json['country'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      vintage: json['vintage'],
      type: json['type'],
      acidity: json['acidity'].toDouble(),
      intensity: json['intensity'].toDouble(),
      sweetness: json['sweetness'].toDouble(),
      tannin: json['tannin'].toDouble(),
      abv: json['abv'].toDouble(),
    );
  }
}
