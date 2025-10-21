import 'package:flutter/material.dart';
import 'package:kitchen_guide/db/recipe_dao.dart';
import 'package:kitchen_guide/domain/profile.dart';
import 'package:kitchen_guide/pages/homepage/recipe_carousell.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../db/profile_dao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<RecipeCarousell>> carousselList;
  late Future<Profile?> userProfile;
  late Future<SharedPreferences> prefs;

  @override
  void initState() {
    carousselList = RecipeDao().getRecipeCarousells();
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
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFE41D56),
                  ),
                );
              }

              if (!snapshot.hasData) {


              }
              Profile? profile = snapshot.hasData ? snapshot.requireData : null;
              return buildWelcomeBar(profile);
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
            future: carousselList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<RecipeCarousell> caroussels = snapshot.requireData;
                return ListView.builder(
                  itemCount: caroussels.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return Column(
                      children: [ caroussels[i], SizedBox(height: 20,)],
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

  Widget buildWelcomeBar(Profile? profile) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá, ${profile?.nome ?? '...'}!",
                style:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text("O que você gostaria de cozinhar hoje?")
            ],
          ),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              profile?.urlImage ?? 'https://raw.githubusercontent.com/gleycebarb/fake-api/refs/heads/main/default_pfp.jpg',
              height: 60,
              width: 60,
            ),
          ),
        ],
      ),
    );
  }
}
