class SimpleRecipe {
  final int id;
  final String title;
  final String image;
  final String imageType;

  SimpleRecipe({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });

  factory SimpleRecipe.fromJson(Map<String, dynamic> json) {
    return SimpleRecipe(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      imageType: json['imageType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'imageType': imageType,
    };
  }
}