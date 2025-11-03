import 'package:dio/dio.dart';
import 'package:kitchen_guide/api/recipe_cache.dart';
import 'package:kitchen_guide/api/translate_api.dart';
import 'package:kitchen_guide/domain/full_recipe.dart';
import 'package:kitchen_guide/domain/recipe.dart';
import 'package:kitchen_guide/domain/recipe_list.dart';

class RecipeApi {
  final dio = Dio();
  final TranslateApi translateApi  = TranslateApi();
  final apiKey = 'd2cc58e1144f4a9ba028a5728d66538f';
  final String fakeApiUrl = 'https://my-json-server.typicode.com/gleycebarb/fake-api';
  final String recipeApiUrl = 'https://api.spoonacular.com/recipes';
  final String cachedEndpoint = 'http://192.168.1.202:8080/fetch?url=';

  Future<List<RecipeList>> fetchRecipesLists() async {
    final response = await dio.get('$fakeApiUrl/RecipeLists');
    if (response.statusCode != 200) return [];

    List<RecipeList> recipeLists = (response.data as List)
      .map((json) => RecipeList.fromJson(json))
      .toList();

    return recipeLists;
  }

  Future<List<Recipe>> getRecipes(List<String> recipesApiIds) async {
    try {
      final List<Recipe> cachedRecipeData = RecipeCache.getRecipes(recipesApiIds);
      final List<String> willBeRequestedIds = RecipeCache.getMissingIds(recipesApiIds);

      if (willBeRequestedIds.isEmpty) {
        return cachedRecipeData;
      }

      final Map<String, dynamic> queryParams = {
        'apiKey': apiKey,
        'ids': willBeRequestedIds.join(',')
      };

      Response response = await dio.get(
        '$recipeApiUrl/informationBulk',
        queryParameters: queryParams,
      );

      if (response.statusCode != 200) {
        return [];
      }

      List<Recipe> requestedRecipes = (await _translateResponseData(response.data))
        .map((json) => Recipe.fromJson(json))
        .toList();

      RecipeCache.addRecipes(requestedRecipes);

      return [ ...requestedRecipes, ...cachedRecipeData ];
    } catch(err) {
      print('Erro ao buscar receitas por ids');
      print(err.toString());
      return [];
    }
  }

  Future<FullRecipe?> getFullRecipe(int recipeId) async {
    try {
      final Map<String, dynamic> queryParams = {
        'apiKey': apiKey,
      };

      Response response = await dio.get(
        '$recipeApiUrl/$recipeId/information',
        queryParameters: queryParams,
      );

      if (response.statusCode != 200) {
        return null;
      }

      return FullRecipe.fromJson(await _translateFullRecipe(response.data));
    } catch(err) {
      print('Erro ao buscar receita por id');
      print(err.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>> _translateFullRecipe(Map<String, dynamic> data) async {
    data["title"] = await translateApi.translateToPortuguese(data["title"]);
    if (data["instructions"] != null) {
      data["instructions"] = data["instructions"].replaceAll(RegExp(r'<[^>]*>'), '');
    }
    if (data["summary"] != null) {
      data["summary"] = data["summary"].replaceAll(RegExp(r'<[^>]*>'), '');
    }
    return data;
  }

  Future<List<dynamic>> _translateResponseData(List<dynamic> data) async {
    List<Map<String, dynamic>> result = [];
    for (var json in data) {
      json["title"] = await translateApi.translateToPortuguese(json["title"]);
      result.add(json);
    }
    return result;
  }
}
