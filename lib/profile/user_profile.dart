import 'package:flutter/material.dart';
import 'package:kitchen_guide/bottom_app_bar.dart';
import 'package:kitchen_guide/profile/container_user_info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ContainerUserInfo(),
            SizedBox(height: 30),
            buildContainer(Icons.bookmark, 'Receitas salvas', 'Suas receitas salvas aqui.'),
            SizedBox(height: 3),
            buildContainer(Icons.manage_accounts, 'Gerenciar conta', 'Edite com detalhes a sua conta.'),
            SizedBox(height: 3),
            buildContainer(Icons.settings, 'Configurações', 'Algumas configurações do App.'),
            SizedBox(height: 3),
            buildContainer(Icons.headset_mic_rounded, 'Central de ajuda', 'Entre em contato com o suporte.'),
          ],
        ),
      ),
    );
  }
}

buildContainer(IconData icon, String titulo, String subtitulo){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD9D9D9).withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 4),
          )
        ]
    ),
    width: double.infinity,
    height: 80,
    child: Row(
      spacing: 15,
      children: [
        Icon(icon, size: 40),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titulo, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text(subtitulo),
          ],
        )
      ],
    ),
  );
}
