class AiChat {
  final State state;
  final String message;

  AiChat({required this.state, required this.message});

  factory AiChat.fromJson(Map<String, dynamic> json) {
    return AiChat(
      state: State.fromJson(json['state']),
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'state': state.toJson(),
      'message': message,
    };
  }
}

class State {
  final int? tastingNoteId;
  final int wineId;
  final int? colorId;
  final List<int> flavourTasteIds;
  final double? sweetness;
  final double? intensity;
  final double? acidity;
  final double? alcohol;
  final double? tannin;
  final String opinion;
  final double? rating;

  State({
    this.tastingNoteId,
    required this.wineId,
    this.colorId,
    required this.flavourTasteIds,
    this.sweetness,
    this.intensity,
    this.acidity,
    this.alcohol,
    this.tannin,
    required this.opinion,
    this.rating,
  });

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      tastingNoteId: json['tastingNoteId'],
      wineId: json['wineId'],
      colorId: json['colorId'],
      flavourTasteIds: List<int>.from(json['flavourTasteIds']),
      sweetness: json['sweetness']?.toDouble(),
      intensity: json['intensity']?.toDouble(),
      acidity: json['acidity']?.toDouble(),
      alcohol: json['alcohol']?.toDouble(),
      tannin: json['tannin']?.toDouble(),
      opinion: json['opinion'],
      rating: json['rating']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tastingNoteId': tastingNoteId,
      'wineId': wineId,
      'colorId': colorId,
      'flavourTasteIds': flavourTasteIds,
      'sweetness': sweetness,
      'intensity': intensity,
      'acidity': acidity,
      'alcohol': alcohol,
      'tannin': tannin,
      'opinion': opinion,
      'rating': rating,
    };
  }
}