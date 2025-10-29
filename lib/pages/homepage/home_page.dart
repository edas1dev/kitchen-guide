import 'package:flutter/material.dart';
import 'package:kitchen_guide/api/recipe_api.dart';
import 'package:kitchen_guide/domain/profile.dart';
import 'package:kitchen_guide/domain/recipe_list.dart';
import 'package:kitchen_guide/pages/homepage/recipe_carousell.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../db/profile_dao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<RecipeList>> carouselDataList;
  late Future<Profile?> userProfile;
  late Future<SharedPreferences> prefs;

  @override
  void initState() {
    carouselDataList = RecipeApi().fetchRecipesLists();
    userProfile = ProfileDao().getLoggedUser();
    prefs = SharedPreferences.getInstance();

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          FutureBuilder(
            future: userProfile,
            builder: (context, snapshot)  {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFE41D56),
                  ),
                );

              }
              return buildWelcomeBar(snapshot.requireData!);
            },
          ),
          SizedBox(height: 20,),
          Container(
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

          FutureBuilder(
            future: carouselDataList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<RecipeList> carouselsData = snapshot.requireData;
                return ListView.builder(
                  itemCount: carouselsData.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return Column(
                      children: [ RecipeCarousell(recipeList: carouselsData[i]), SizedBox(height: 20,)],
                    );
                  },
                );
              }

              return Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFE41D56),
                  ));
            },
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget buildWelcomeBar(Profile profile) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá, ${profile.nome}!",
                style:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text("O que você gostaria de cozinhar hoje?")
            ],
          ),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: profile.urlImage == ""
                ? Image.asset('assets/images/default_pfp.jpg', height: 60, width: 60,)
                : Image.network(profile.urlImage, height: 60, width: 60),
          ),
        ],
      ),
    );
  }
}
