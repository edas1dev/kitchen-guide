import 'package:flutter/material.dart';
import 'package:kitchen_guide/db/recipe_dao.dart';
import 'package:kitchen_guide/domain/profile.dart';
import 'package:kitchen_guide/pages/homepage/recipe_card.dart';
import 'package:kitchen_guide/pages/homepage/recipe_carousell.dart';

import '../../db/profile_dao.dart';
import '../../domain/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipeList = [];
  Profile? userProfile;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    recipeList = await RecipeDao().getAllRecipes();
    userProfile = await ProfileDao().getFirstUser();
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    final String userName = userProfile?.nome ?? '...';
    final String userProfileImage = userProfile?.urlImage ?? 'assets/images/default_pfp.jpg';

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView( // Coluna principal
        children: [
          Padding( // Barra de boas vindas
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Olá, $userName!",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    Text("O que você gostaria de cozinhar hoje?")
                  ],
                ),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    userProfileImage,
                    height: 60,
                    width: 60,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container( // Barra de pesqusa
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'Pesquisar...',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Image.asset('assets/images/banner.jpeg'),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.8),
                          Colors.transparent,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text('Descubra receitas para o São João!', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20
                    ), softWrap: true,),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          RecipeCarousell(
            title: 'Popular hoje!',
            subtitle: 'Ver mais',
            recipes: recipeList.isEmpty ? recipeList : recipeList.sublist(0, 3)
          ),
          SizedBox(height: 20,),
          RecipeCarousell(
            title: 'Top fitness',
            subtitle: 'Ver mais',
            recipes: recipeList.isEmpty ? recipeList : recipeList.sublist(3, 6)
          )
        ],
      ),
    );
  }
}
