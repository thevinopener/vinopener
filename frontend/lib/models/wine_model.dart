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
  List<String>? flavours;
  bool? isBookmarked;
  bool? isAddedToCellar;
  int? countOfNotes;

  Wine.dummy()
      : id = 1,
        winery = 'Shafer',
        name = 'Shafer Hillside Select Cabernet Sauvignon 2019',
        imageUrl = 'https://picsum.photos/200/200',
        country = 'korea',
        type = 'red';

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
    this.flavours,
    this.isBookmarked,
    this.isAddedToCellar,
    this.countOfNotes,
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
    flavours = json['flavours'];
    isBookmarked = json['isBookmarked'];
    isAddedToCellar = json['isAddedToCellar'];
    countOfNotes = json['countOfNotes'];
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
    data['flavours'] = this.flavours;
    data['isBookmarked'] = this.isBookmarked;
    data['isAddedToCellar'] = this.isAddedToCellar;
    data['countOfNotes'] = this.countOfNotes;
    return data;
  }
}
