import 'package:flutter/material.dart';

// Flavour 모델
class Flavour {
  final int id; // 타입을 double에서 int로 변경
  final String taste;

  Flavour({required this.id, required this.taste});

  factory Flavour.fromJson(Map<String, dynamic> json) {
    return Flavour(
      id: json['id'],
      taste: json['taste'],
    );
  }
}

// WineColor 모델
class WineColor {
  final int id; // 타입을 double에서 int로 변경
  final String name;

  WineColor({required this.id, required this.name});

  factory WineColor.fromJson(Map<String, dynamic> json) {
    return WineColor(
      id: json['id'],
      name: json['name'],
    );
  }
}

// Wine 모델
class NoteWine {
  final int id;
  final String name;
  final String imageUrl;
  final String winery;
  final String country;

  NoteWine({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.winery,
    required this.country,
  });

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

// WineNoteCard 모델
class WineNoteCard {
  final int id; // 타입을 double에서 int로 변경
  final NoteWine wine;
  final WineColor color;
  final double rating; // 실수 필드는 그대로
  final List<Flavour> flavours;

  WineNoteCard({
    required this.id,
    required this.wine,
    required this.color,
    required this.rating,
    required this.flavours,
  });

  factory WineNoteCard.fromJson(Map<String, dynamic> json) {
    var flavourList = json['flavours'] as List;
    List<Flavour> flavours =
        flavourList.map((i) => Flavour.fromJson(i)).toList();

    return WineNoteCard(
      id: json['id'],
      wine: NoteWine.fromJson(json['wine']),
      color: WineColor.fromJson(json['color']),
      rating: json['rating'].toDouble(),
      // double 필드는 데이터 타입 변경 없이 처리
      flavours: flavours,
    );
  }
}

class NoteDetailFlavour {
  final int id;
  final String taste;
  final String type; // 'type' 필드 추가

  NoteDetailFlavour(
      {required this.id, required this.taste, required this.type});

  factory NoteDetailFlavour.fromJson(Map<String, dynamic> json) {
    return NoteDetailFlavour(
      id: json['id'],
      taste: json['taste'],
      type: json['type'],
    );
  }
}

class NoteDetailModel {
  final int id;
  final NoteWine wine;
  final WineColor color;
  final double sweetness;
  final double intensity;
  final double acidity;
  final double alcohol;
  final double tannin;
  final String opinion;
  final double rating;
  final List<NoteDetailFlavour> flavours;
  final DateTime updatedTime;

  NoteDetailModel({
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

  // JSON으로부터 NoteDetail 객체를 생성하는 factory 메서드
  factory NoteDetailModel.fromJson(Map<String, dynamic> json) {
    var flavourList = json['flavours'] as List;
    List<NoteDetailFlavour> flavours =
        flavourList.map((i) => NoteDetailFlavour.fromJson(i)).toList();

    return NoteDetailModel(
      id: json['id'],
      wine: NoteWine.fromJson(json['wine']),
      color: WineColor.fromJson(json['color']),
      sweetness: json['sweetness'].toDouble(),
      intensity: json['intensity'].toDouble(),
      acidity: json['acidity'].toDouble(),
      alcohol: json['alcohol'].toDouble(),
      tannin: json['tannin'].toDouble(),
      opinion: json['opinion'],
      rating: json['rating'].toDouble(),
      flavours: flavours,
      updatedTime: DateTime.parse(json['updatedTime']),
    );
  }
}
