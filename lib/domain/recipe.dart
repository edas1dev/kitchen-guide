class Recipe {
  late String title;
  late String kcal;
  late String time;
  late String image;
  late bool bookmarked;
  
  Recipe({
    required this.title,
    required this.kcal,
    required this.time,
    required this.image,
    required this.bookmarked,
  });

  Recipe.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    kcal = json['kcal'];
    time = json['time'];
    image = json['image'];
    bookmarked = json['bookmarked'] == 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = this.title;
    data['kcal'] = this.kcal;
    data['time'] = this.time;
    data['image'] = this.image;
    data['bookmarked'] = this.bookmarked;
    return data;
  }
}