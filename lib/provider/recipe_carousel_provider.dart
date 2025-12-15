import 'package:flutter/material.dart';
import 'package:kitchen_guide/api/recipe_api.dart';
import 'package:kitchen_guide/domain/recipe_list.dart';

class RecipeCarouselProvider extends ChangeNotifier {
  List<RecipeList>? _carousels;
  bool _loading = false;

  List<RecipeList>? get carousels => _carousels;
  bool get isLoading => _loading;

  Future<void> loadCarousels() async {
    if (_loading) return;

    _loading = true;
    notifyListeners();

    _carousels = await RecipeApi().fetchRecipesLists();

    _loading = false;
    notifyListeners();
  }
}
