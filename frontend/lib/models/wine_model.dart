class Wine {
  final int wineId;
  final String winery;
  final String name;
  final String imageUrl;
  final String type;

  Wine({
    required this.wineId,
    required this.winery,
    required this.name,
    required this.imageUrl,
    required this.type,
  });

  Wine.dummy()
      : wineId = 1,
        winery = 'Shafer',
        name = 'Shafer Hillside Select Cabernet Sauvignon 2019',
        imageUrl = 'https://picsum.photos/200/200',
        type = 'Red';
}
