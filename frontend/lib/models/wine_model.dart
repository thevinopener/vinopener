class Wine {
  int? id;
  String? name;
  String? imageUrl;
  String? grape;
  String? winery;
  String? country;
  double? price;
  double? rating;
  int? vintage;
  String? type;
  double? acidity;
  double? intensity;
  double? sweetness;
  double? tannin;
  double? abv;
  int? view;

  Wine.dummy()
      : id = 1,
        winery = 'Shafer',
        name = 'Shafer Hillside Select Cabernet Sauvignon 2019',
        imageUrl = 'https://picsum.photos/200/200',
        type = 'Red';

  Wine({
    this.id,
    this.name,
    this.imageUrl,
    this.grape,
    this.winery,
    this.country,
    this.price,
    this.rating,
    this.vintage,
    this.type,
    this.acidity,
    this.intensity,
    this.sweetness,
    this.tannin,
    this.abv,
    this.view,
  });

  Wine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    grape = json['grape'];
    winery = json['winery'];
    country = json['country'];
    price = json['price'];
    rating = json['rating'];
    vintage = json['vintage'];
    type = json['type'];
    acidity = json['acidity'];
    intensity = json['intensity'];
    sweetness = json['sweetness'];
    tannin = json['tannin'];
    abv = json['abv'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['grape'] = this.grape;
    data['winery'] = this.winery;
    data['country'] = this.country;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['vintage'] = this.vintage;
    data['type'] = this.type;
    data['acidity'] = this.acidity;
    data['intensity'] = this.intensity;
    data['sweetness'] = this.sweetness;
    data['tannin'] = this.tannin;
    data['abv'] = this.abv;
    data['view'] = this.view;
    return data;
  }
}
