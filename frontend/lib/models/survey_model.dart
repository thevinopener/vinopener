class Survey{
  final Set<String> type;
  final int minAbv;
  final int maxAbv;
  final int sweetness;
  final int acidity;
  final int tannin;

  Survey({
    required this.type,
    required this.maxAbv,
    required this.minAbv,
    required this.sweetness,
    required this.acidity,
    required this.tannin,
});

}