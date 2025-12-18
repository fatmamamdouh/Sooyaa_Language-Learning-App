class LanguageModel {
  final int id;
  final String name;
  final String image;

  LanguageModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      id: json['id'],
      name: json['name'],
      image: json['image'] ?? '',
    );
  }
}
