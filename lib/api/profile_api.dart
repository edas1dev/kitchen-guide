import 'package:dio/dio.dart';
import 'dart:math';

class ProfileApi {
  final dio = Dio();
  final String fakeApiBaseUrl = 'https://my-json-server.typicode.com/gleycebarb/fake-api';
  final String avatarGeneratorBaseUrl = 'https://testingbot.com/free-online-tools/random-avatar';

  String getAvatarUrlWithRandomSize(int maxSize) {
    final random = Random();
    final randomSize = random.nextInt(maxSize) + 1;
    return '$avatarGeneratorBaseUrl/$randomSize';
  }

  Future<Map<String, dynamic>> fetchProfileByEmail(String email) async {
    try {
      final response = await dio.get('$fakeApiBaseUrl/Profile');
      final String randomImageUrl = getAvatarUrlWithRandomSize(1000);

      if (response.statusCode == 200 && response.data != null) {
        final List profiles = response.data;
        final profileData = profiles.firstWhere((p) => p['email'] == email, orElse: () => null);
        if (profileData != null) {
          if (profileData['urlImage'] == null || profileData['urlImage'].isEmpty) {
            profileData['urlImage'] = randomImageUrl;
          }
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