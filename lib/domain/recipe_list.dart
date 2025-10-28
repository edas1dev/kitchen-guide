class RecipeList {
  final String title;
  final List<String> list;

  RecipeList({
    required this.title,
    required this.list,
  });

  factory RecipeList.fromJson(Map<String, dynamic> json) {
    return RecipeList(
      title: json['title'] as String,
      list: List<String>.from(json['list'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'list': list,
    };
  }
}