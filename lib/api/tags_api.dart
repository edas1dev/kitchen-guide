import 'package:dio/dio.dart';
import 'package:kitchen_guide/api/translate_api.dart';
import '../domain/tag.dart';

class TagsApi {
  final dio = Dio();
  final apiKey = 'cfa55de7fc7746c7ace37e8dc5ec6334';
  final String fakeApiUrl = 'https://my-json-server.typicode.com/gleycebarb/fake-api';
  final String recipeApiUrl = 'https://api.spoonacular.com/recipes';
  final TranslateApi translateApi = TranslateApi();

  Future<List<Tag>> findAll() async {
    List<Tag> listaTags = [];

    final response = await dio.get('$fakeApiUrl/PopularTags');

    for (var json in response.data as List) {
      Tag tag = Tag(nome: json);
      listaTags.add(tag);
    }

    return listaTags;
  }

  Future<int> getRecipe(List<String> listaTags) async {
    String tags = listaTags.join(',+');

    final Map<String, dynamic> queryParams = {
      'apiKey': apiKey,
      'ingredients': await translateApi.translateToEnglish(tags),
      'number': 1,
    };

    final Response response = await dio.get(
      '$recipeApiUrl/findByIngredients',
      queryParameters: queryParams,
    );

    if (response.statusCode != 200) {
      return 0;
    }

    return response.data[0]["id"] as int;
  }
}

