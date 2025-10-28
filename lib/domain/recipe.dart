class Recipe {
  final int id;
  final String title;
  final String image;
  final int readyInMinutes;
  final int servings;

  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.servings,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      readyInMinutes: json['readyInMinutes'] as int,
      servings: json['servings'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'readyInMinutes': readyInMinutes,
      'servings': servings,
    };
  }
}