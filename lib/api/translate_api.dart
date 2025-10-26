import 'package:dio/dio.dart';

class TranslateApi {
  final dio = Dio();
  String _baseUrl (lang, text) => 'https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$lang&dt=t&q=$text';

  Future<String> translateToPortuguese(String text) async {
    final Response response = await dio.get(_baseUrl('pt-BR', text));

    if (response.statusCode != 200) {
      return "";
    }

    return response.data[0][0][0];
  }
}
