import '../domain/recipe.dart';

class RecipeCache {
  static final Map<String, Recipe> _cache = {};

  static void addRecipes(List<Recipe> recipes) {
    for (final recipe in recipes) {
      _cache[recipe.id.toString()] = recipe;
    }
  }

  static Recipe? getRecipe(String id) {
    if (_cache.containsKey(id)) {
      return _cache[id];
    }
    return null;
  }

  static List<Recipe> getRecipes(List<String> ids) {
    final List<Recipe> result = [];
    for (final id in ids) {
      final cached = getRecipe(id);
      if (cached != null) {
        result.add(cached);
      }
    }
    return result;
  }

  static List<String> getMissingIds(List<String> ids) {
    return ids.where((id) => !_cache.containsKey(id)).toList();
  }
}