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
      required this.country});

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
