class NoteWine {
  final int id;
  final String name;
  final String imageUrl;
  final String winery;
  final String country;

  NoteWine(
      {required this.id, required this.name, required this.imageUrl, required this.winery, required this.country});
}

class WineColor{
  final int id;
  final String name;

  WineColor({required this.id, required this.name});
}

class Flavour {
  final int id;
  final String taste;

  Flavour({required this.id, required this.taste});
}

class NoteList {
  final int id;
  final NoteWine noteWine;
  final WineColor color;
  final double rating;
  final List<Flavour> flavours;

  NoteList({required this.id, required this.noteWine, required this.color, required this.rating, required this.flavours});

}