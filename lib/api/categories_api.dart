import 'package:dio/dio.dart';
import '../domain/category.dart';

class CategoriesApi {
  final dio = Dio();
  final String baseUrl = 'https://my-json-server.typicode.com/gleycebarb/fake-api';

  Future<List<Category>> findAll() async {
    List<Category> listaCategorias = [];

    final response = await dio.get('$baseUrl/categories');

    if (response.statusCode == 200) {
      var listResult = response.data;

      for (var json in listResult) {
        Category categoria = Category.fromJson(json);
        listaCategorias.add(categoria);
      }
    }

    return listaCategorias;
  }
}
