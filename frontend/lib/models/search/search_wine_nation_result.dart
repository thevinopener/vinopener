class WineNationSearch {
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

  WineNationSearch({
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
  });

  factory WineNationSearch.fromJson(Map<String, dynamic> json) {
    return WineNationSearch(
      id: json['id'],
      name: json['name'],
      seoName: json['seoName'],
      imageUrl: json['imageUrl'],
      grape: json['grape'],
      winery: json['winery'],
      country: json['country'],
      price: json['price']?.toDouble() ?? 0.0,
      rating: json['rating']?.toDouble() ?? 0.0,
      vintage: json['vintage'],
      type: json['type'],
      acidity: json['acidity']?.toDouble() ?? 0.0,
      intensity: json['intensity']?.toDouble() ?? 0.0,
      sweetness: json['sweetness']?.toDouble() ?? 0.0,
      tannin: json['tannin']?.toDouble() ?? 0.0,
      abv: json['abv']?.toDouble() ?? 0.0,
      view: json['view'],
      isBookmark: json['isBookmark'],
      isCellar: json['isCellar'],
      totalNotes: json['totalNotes'],
    );
  }
}
