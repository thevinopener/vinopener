// lib/models/wine.dart
import 'package:frontend/models/taste.dart';

class WineDetail {
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
  final int view;
  final bool isBookmark;
  final bool isCellar;
  final int totalNotes;
  final List<Taste> tastes;

  WineDetail({
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
    required this.view,
    required this.isBookmark,
    required this.isCellar,
    required this.totalNotes,
    required this.tastes,
  });

  // JSON 데이터를 받아와 Wine 객체로 변환
  factory WineDetail.fromJson(Map<String, dynamic> json) {
    return WineDetail(
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
      view: json['view'],
      isBookmark: json['isBookmark'],
      isCellar: json['isCellar'],
      totalNotes: json['totalNotes'],
      tastes: (json['tastes'] as List<dynamic>)
          .map((tasteJson) => Taste.fromJson(tasteJson))
          .toList(),
    );
  }

  // Wine 객체를 JSON 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'seoName': seoName,
      'imageUrl': imageUrl,
      'grape': grape,
      'winery': winery,
      'country': country,
      'price': price,
      'rating': rating,
      'vintage': vintage,
      'type': type,
      'acidity': acidity,
      'intensity': intensity,
      'sweetness': sweetness,
      'tannin': tannin,
      'abv': abv,
      'view': view,
      'isBookmark': isBookmark,
      'isCellar': isCellar,
      'totalNotes': totalNotes,
      'tastes': tastes.map((taste) => taste.toJson()).toList(),
    };
  }
}
