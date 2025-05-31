import 'package:flutter/material.dart';
import 'package:kitchen_guide/profile/profile_containers/saved_recipes.dart';
import 'package:kitchen_guide/profile/profile_containers/container_user_info.dart';

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
      bottomNavigationBar: BottomAppBar(
        height: 93,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildColumnIcons(Icons.home_outlined, 'Casa'),
            buildColumnIcons(Icons.search, 'Busca'),
            buildColumnIcons(Icons.category_outlined, 'Categorias'),
            buildColumnIcons(Icons.person_outline, 'Perfil'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ContainerUserInfo(),
            SizedBox(height: 30),
            //SavedRecipes(),
          ],
        ),
      ),
    );
  }
}

buildColumnIcons(IconData icon, String nomeIcon){
  return Column(
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(icon),
        iconSize: 30,
      ),
      Text(nomeIcon, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
    ],
  );
}
