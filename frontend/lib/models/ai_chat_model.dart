class AiChat {
  final NoteState state;
  final String message;

  AiChat({required this.state, required this.message});

  factory AiChat.fromJson(Map<String, dynamic> json) {
    return AiChat(
      state: NoteState.fromJson(json['state']),
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

class NoteState {
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

  NoteState({
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

  factory NoteState.fromJson(Map<String, dynamic> json) {
    return NoteState(
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
      'sweetness': sweetness?.toDouble(),
      'intensity': intensity?.toDouble(),
      'acidity': acidity?.toDouble(),
      'alcohol': alcohol?.toDouble(),
      'tannin': tannin?.toDouble(),
      'opinion': opinion,
      'rating': rating?.toDouble(),
    };
  }
}

class AiColorDetail {
  int id;
  String name;

  AiColorDetail({
    required this.id,
    required this.name,
  });

  factory AiColorDetail.fromJson(Map<String, dynamic> json) {
    return AiColorDetail(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class AiFlavourDetail {
  int id;
  String taste;

  AiFlavourDetail({
    required this.id,
    required this.taste,
  });

  factory AiFlavourDetail.fromJson(Map<String, dynamic> json) {
    return AiFlavourDetail(
      id: json['id'],
      taste: json['taste'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taste': taste,
    };
  }
}
class AiAnswer {
  final int id;
  final String section;
  final NewState newState;
  final String message;
  final DateTime createdTime;

  AiAnswer({
    required this.id,
    required this.section,
    required this.newState,
    required this.message,
    required this.createdTime,
  });

  factory AiAnswer.fromJson(Map<String, dynamic> json) {
    return AiAnswer(
      id: json['id'],
      section: json['section'],
      newState: NewState.fromJson(json['newState']),
      message: json['message'],
      createdTime: DateTime.parse(json['createdTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'section': section,
      'newState': newState.toJson(),
      'message': message,
      'createdTime': createdTime.toIso8601String(),
    };
  }
}

class NewState {
  final AiColorDetail color;
  final List<AiFlavourDetail> flavours;
  final double? sweetness;
  final double? intensity;
  final double? acidity;
  final double? alcohol;
  final double? tannin;
  final String? opinion;
  final double? rating;

  NewState({
    required this.color,
    required this.flavours,
    this.sweetness,
    this.intensity,
    this.acidity,
    this.alcohol,
    this.tannin,
    this.opinion,
    this.rating,
  });

  factory NewState.fromJson(Map<String, dynamic> json) {
    return NewState(
      color: AiColorDetail.fromJson(json['color']),
      flavours: (json['flavours'] as List).map((f) => AiFlavourDetail.fromJson(f)).toList(),
      sweetness: json['sweetness'],
      intensity: json['intensity'],
      acidity: json['acidity'],
      alcohol: json['alcohol'],
      tannin: json['tannin'],
      opinion: json['opinion'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color.toJson(),
      'flavours': flavours.map((f) => f.toJson()).toList(),
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