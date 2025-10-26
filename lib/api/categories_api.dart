import 'package:dio/dio.dart';
import 'package:kitchen_guide/api/translate_api.dart';
import 'package:kitchen_guide/domain/simple_recipe.dart';
import '../domain/category.dart';

class CategoriesApi {
  final dio = Dio();
  final apiKey = 'e7a8f460dd9443ea98f31b079d3610e1';
  final String fakeApiUrl = 'https://my-json-server.typicode.com/gleycebarb/fake-api';
  final String recipeApiUrl = 'https://api.spoonacular.com/recipes'; // ?cuisine=italian&apiKey=e7a8f460dd9443ea98f31b079d3610e1';

  Future<List<Category>> findAll() async {
    List<Category> listaCategorias = [];

    final response = await dio.get('$fakeApiUrl/categories');

    if (response.statusCode == 200) {
      var listResult = response.data;

      for (var json in listResult) {
        Category categoria = Category.fromJson(json);
        listaCategorias.add(categoria);
      }
    }

    return listaCategorias;
  }
  
  Future<List<SimpleRecipe>> getRecipes(List<String> categoriaQuery) async {
    final Map<String, dynamic> queryParams = {
      'apiKey': apiKey,
      'number': 2,
    };

    queryParams[categoriaQuery[0]] = categoriaQuery[1];

    final Response response = await dio.get(
      '$recipeApiUrl/complexSearch',
      queryParameters: queryParams,
    );

    if (response.statusCode != 200) {
      return [];
    }

    List<SimpleRecipe> recipes = [];
    var results = response.data['results'];
    for (var json in results) {
      recipes.add(SimpleRecipe.fromJson(json));
    }

    return recipes;
  }
}
