class NoteWine {
  final int id;
  final String name;
  final String imageUrl;
  final String winery;
  final String country;

  NoteWine.dummy()
      : id = 1,
        winery = 'Shafer',
        name = 'Shafer Hillside Select Cabernet Sauvignon 2019',
        imageUrl = 'https://wine21.speedgabia.com/WINE_MST/TITLE/0176000/W0176838.png',
        country = 'korea';

  NoteWine(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.winery,
      required this.country,});

  factory NoteWine.fromJson(Map<String, dynamic> json) {
    return NoteWine(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      winery: json['winery'],
      country: json['country'],
    );
  }
}

class WineColor {
  final int id;
  final String name;

  WineColor.dummy()
      : id = 1,
        name = "밑집색";

  WineColor({required this.id, required this.name});

  factory WineColor.fromJson(Map<String, dynamic> json) {
    return WineColor(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Flavour {
  final int id;
  final String taste;

  Flavour({required this.id, required this.taste});

  factory Flavour.fromJson(Map<String, dynamic> json) {
    return Flavour(
      id: json['id'],
      taste: json['taste'],
    );
  }
}

class Note {
  final int id;
  final NoteWine wine;
  final WineColor color;
  final int rating;
  final List<Flavour> flavours;

  Note(
      {required this.id,
      required this.wine,
      required this.color,
      required this.rating,
      required this.flavours});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      wine: NoteWine.fromJson(json['wine']),
      color: WineColor.fromJson(json['color']),
      rating: json['rating'],
      flavours:
          List<Flavour>.from(json['flavours'].map((x) => Flavour.fromJson(x))),
    );
  }

  factory Note.dummy() {
    return Note(
        id: 1,
        wine: NoteWine.dummy(),
        color: WineColor.dummy(),
        rating: 5,
        flavours: [
          Flavour(id: 1, taste: "딸기"),
          Flavour(id: 2, taste: "라즈베리"),
          Flavour(id: 3, taste: "붉은자두"),
          Flavour(id: 4, taste: "석류"),
        ]);
  }
}

class NoteDetailWineReview {
  final int id;
  final NoteDetailWine wine;
  final ColorDetail color;
  final double sweetness;
  final double intensity;
  final double acidity;
  final double alcohol;
  final double tannin;
  final String opinion;
  final double rating;
  final List<NoteDetailFlavour> flavours;
  final DateTime updatedTime;

  NoteDetailWineReview({
    required this.id,
    required this.wine,
    required this.color,
    required this.sweetness,
    required this.intensity,
    required this.acidity,
    required this.alcohol,
    required this.tannin,
    required this.opinion,
    required this.rating,
    required this.flavours,
    required this.updatedTime,
  });

  factory NoteDetailWineReview.fromJson(Map<String, dynamic> json) {
    return NoteDetailWineReview(
      id: json['id'],
      wine: NoteDetailWine.fromJson(json['wine']),
      color: ColorDetail.fromJson(json['color']),
      sweetness: json['sweetness'].toDouble(),
      intensity: json['intensity'].toDouble(),
      acidity: json['acidity'].toDouble(),
      alcohol: json['alcohol'].toDouble(),
      tannin: json['tannin'].toDouble(),
      opinion: json['opinion'],
      rating: json['rating'].toDouble(),
      flavours: List<NoteDetailFlavour>.from(json['flavours'].map((x) => NoteDetailFlavour.fromJson(x))),
      updatedTime: DateTime.parse(json['updatedTime']),
    );
  }

  static NoteDetailWineReview dummy() {
    return NoteDetailWineReview(
      id: 1,
      wine: NoteDetailWine.dummy(),
      color: ColorDetail.dummy(),
      sweetness: 5.0,
      intensity: 4.0,
      acidity: 3.5,
      alcohol: 14.0,
      tannin: 3.0,
      opinion: 'Excellent wine with rich flavors.',
      rating: 4.5,
      flavours: [
        NoteDetailFlavour(id: 1, taste: "딸기", type: '붉은 과일'),
        NoteDetailFlavour(id: 2, taste: "라즈베리", type: '불은 과일'),
        NoteDetailFlavour(id: 3, taste: "붉은자두", type: '붉은 과일'),
    NoteDetailFlavour(id: 4, taste: "석류", type: '붉은 과일'),
    ],
      updatedTime: DateTime.now(),
    );
  }
}

class NoteDetailWine {
  final int id;
  final String name;
  final String imageUrl;
  final String winery;
  final String country;
  final String type;

  NoteDetailWine({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.winery,
    required this.country,
    required this.type,
  });

  factory NoteDetailWine.fromJson(Map<String, dynamic> json) {
    return NoteDetailWine(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      winery: json['winery'],
      country: json['country'],
      type: json['type'],
    );
  }

  static NoteDetailWine dummy() {
    return NoteDetailWine(
      id: 1,
      name: 'Shafer Hillside Select Cabernet Sauvignon 2019',
      imageUrl: 'https://wine21.speedgabia.com/WINE_MST/TITLE/0176000/W0176838.png',
      winery: 'Shafer',
      country: 'USA',
      type: 'RED',
    );
  }
}


class ColorDetail {
  final int id;
  final String name;

  ColorDetail({
    required this.id,
    required this.name,
  });

  factory ColorDetail.fromJson(Map<String, dynamic> json) {
    return ColorDetail(
      id: json['id'],
      name: json['name'],
    );
  }
  static ColorDetail dummy() {
    return ColorDetail(
      id: 10,
      name: '보라색'
    );
  }

}

class NoteDetailFlavour {
  final int id;
  final String type;
  final String taste;


  NoteDetailFlavour({
    required this.id,
    required this.type,
    required this.taste,
  });

  factory NoteDetailFlavour.fromJson(Map<String, dynamic> json) {
    return NoteDetailFlavour(
      id: json['id'],
      type: json['type'],
      taste: json['taste'],
    );
  }
}
