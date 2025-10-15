import 'package:dio/dio.dart';
import 'package:kitchen_guide/domain/profile.dart';

class ProfileApi {
  final dio = Dio();
  final String baseUrl = 'https://my-json-server.typicode.com/gleycebarb/fake-api';

  Future<Map<String, dynamic>> fetchProfileByEmail(String email) async {
    try {
      final response = await dio.get('$baseUrl/Profile');
      if (response.statusCode == 200 && response.data != null) {
        final List profiles = response.data;
        final profileData = profiles.firstWhere(
          (p) => p['email'] == email,
          orElse: () => null
        );
        if (profileData != null) {
          return profileData;
        } else {
          throw Exception('Perfil não encontrado para o email informado.');
        }
      } else {
        throw Exception('Erro ao obter dados do servidor.');
      }
    } catch (e) {
      throw Exception('Erro inesperado: $e');
    }
  }
}