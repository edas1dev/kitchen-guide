class ExtendedIngredient {
  final int id;
  final String name;
  final String original;
  final double amount;
  final String unit;
  final String? image;

  ExtendedIngredient({
    required this.id,
    required this.name,
    required this.original,
    required this.amount,
    required this.unit,
    this.image,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) {
    return ExtendedIngredient(
      id: json['id'] as int,
      name: json['name'] as String,
      original: json['original'] as String,
      amount: (json['measures']['metric']['amount'] as double).toDouble(),
      unit: json['measures']['metric']['unitShort'] as String,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'original': original,
      'amount': amount,
      'unit': unit,
      'image': image,
    };
  }

  String get formattedAmount {
    if (amount == amount.truncateToDouble()) {
      return amount.toInt().toString();
    }
    return amount.toStringAsFixed(1);
  }

  @override
  String toString() {
    return 'ExtendedIngredient{name: $name, amount: $amount $unit}';
  }
}

class FullRecipe {
  final int id;
  final String title;
  final String image;
  final int readyInMinutes;
  final int servings;
  final String summary;
  final String? instructions;
  final bool vegetarian;
  final bool vegan;
  final bool glutenFree;
  final bool dairyFree;
  final List<String> diets;
  final List<String> dishTypes;
  final List<String> cuisines;
  final List<ExtendedIngredient> extendedIngredients;

  FullRecipe({
    required this.id,
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.servings,
    required this.summary,
    this.instructions,
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.dairyFree,
    required this.diets,
    required this.dishTypes,
    required this.cuisines,
    required this.extendedIngredients,
  });

  factory FullRecipe.fromJson(Map<String, dynamic> json) {
    return FullRecipe(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      readyInMinutes: json['readyInMinutes'] as int,
      servings: json['servings'] as int,
      summary: json['summary'] as String,
      instructions: json['instructions'] as String?,
      vegetarian: json['vegetarian'] as bool? ?? false,
      vegan: json['vegan'] as bool? ?? false,
      glutenFree: json['glutenFree'] as bool? ?? false,
      dairyFree: json['dairyFree'] as bool? ?? false,
      diets: List<String>.from(json['diets'] ?? []),
      dishTypes: List<String>.from(json['dishTypes'] ?? []),
      cuisines: List<String>.from(json['cuisines'] ?? []),
      extendedIngredients: List<ExtendedIngredient>.from(
        (json['extendedIngredients'] as List? ?? [])
            .map((ingredient) => ExtendedIngredient.fromJson(ingredient)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'readyInMinutes': readyInMinutes,
      'servings': servings,
      'summary': summary,
      'instructions': instructions,
      'vegetarian': vegetarian,
      'vegan': vegan,
      'glutenFree': glutenFree,
      'dairyFree': dairyFree,
      'diets': diets,
      'dishTypes': dishTypes,
      'cuisines': cuisines,
      'extendedIngredients': extendedIngredients.map((e) => e.toJson()).toList(),
    };
  }

  String get formattedTime {
    if (readyInMinutes < 60) {
      return '$readyInMinutes min';
    } else {
      final hours = readyInMinutes ~/ 60;
      final minutes = readyInMinutes % 60;
      return minutes > 0 ? '${hours}h ${minutes}min' : '${hours}h';
    }
  }

  List<String> get dietaryInfo {
    final List<String> info = [];
    if (vegetarian) info.add('Vegetariana');
    if (vegan) info.add('Vegana');
    if (glutenFree) info.add('Sem glúten');
    if (dairyFree) info.add('Sem lactose');
    return info;
  }
}