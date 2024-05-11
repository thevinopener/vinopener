class WineTypeSearch {
  final int id;
  final String imageUrl;
  final String name;
  final String winery;
  final String country;
  final String type;
  final int view;

  WineTypeSearch({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.winery,
    required this.country,
    required this.type,
    required this.view,
  });

  // JSON 데이터를 받아 Wine 객체로 변환하는 팩토리 메서드
  factory WineTypeSearch.fromJson(Map<String, dynamic> json) {
    return WineTypeSearch(
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      winery: json['winery'],
      country: json['country'],
      type: json['type'],
      view: json['view'],
    );
  }

  // Wine 객체를 JSON 형식으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'winery': winery,
      'country': country,
      'type': type,
      'view': view,
    };
  }
}
