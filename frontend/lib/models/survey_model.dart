import 'package:frontend/constants/wine_type.dart';

class Survey {
  final Set<String> types;
  final int minAbv;
  final int maxAbv;
  final int sweetness;
  final int acidity;
  final int tannin;

  Survey({
    required this.types,
    required this.maxAbv,
    required this.minAbv,
    required this.sweetness,
    required this.acidity,
    required this.tannin,
  });

  Map<String, dynamic> toJson() {
    final List<String> mappedTypes = types.map((type) => WineType.wineTypeMap[type] ?? type).toList();
    return {
      'types': mappedTypes,
      'minAbv': minAbv,
      'maxAbv': maxAbv,
      'sweetness': sweetness,
      'acidity': acidity,
      'tannin': tannin,
    };
  }
}
