class SearchCellarStatus {
  final bool isCellar;

  SearchCellarStatus({required this.isCellar});

  factory SearchCellarStatus.fromJson(Map<String, dynamic> json) {
    return SearchCellarStatus(
        isCellar: json['isCellar']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isCellar': isCellar,
    };
  }
}