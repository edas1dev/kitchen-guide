import 'package:dio/dio.dart';
import 'dart:math';

import 'package:kitchen_guide/domain/profile.dart';

class ProfileApi {
  final dio = Dio();
  final String fakeApiBaseUrl = 'https://my-json-server.typicode.com/gleycebarb/fake-api';
  final String avatarGeneratorBaseUrl = 'https://testingbot.com/free-online-tools/random-avatar';

  String getRandomAvatar() {
    final random = Random();
    final randomSize = random.nextInt(1000) + 1;
    return '$avatarGeneratorBaseUrl/$randomSize';
  }

  Future<Profile> fetchProfileByEmail(String email) async {
    try {
      final response = await dio.get('$fakeApiBaseUrl/Profile');

      if (response.statusCode == 200 && response.data != null) {
        final List profiles = response.data;
        final profileData = profiles.firstWhere((p) => p['email'] == email, orElse: () => null);
        if (profileData != null) {
          return Profile.fromJson(profileData);
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