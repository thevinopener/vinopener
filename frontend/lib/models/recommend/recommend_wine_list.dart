// recommend_wine_list.dart
class RecommendWine {
  final int wineId;
  final String name;
  final String winery;
  final String imageUrl;
  final String country;

  RecommendWine({
    required this.wineId,
    required this.name,
    required this.winery,
    required this.imageUrl,
    required this.country,
  });

  factory RecommendWine.fromJson(Map<String, dynamic> json) {
    return RecommendWine(
      wineId: json['wineId'],
      name: json['name'],
      winery: json['winery'],
      imageUrl: json['imageUrl'],
      country: json['country'],
    );
  }
}
