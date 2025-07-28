import 'package:flutter/material.dart';
import 'package:kitchen_guide/homepage/recipe_card.dart';
import 'package:kitchen_guide/homepage/recipe_carousell.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                      "Olá, Fulano de Tal!",
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
                    'assets/images/profile_person.jpg',
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
            recipes: [
              RecipeCard(
                title: 'Omelete de Legumes',
                kcal: '180 kcal',
                time: '10 min',
                image: Image.asset('assets/images/recipes/omelete.jpg'),
                bookmarked: true,
              ),
              RecipeCard(
                title: 'Macarrão Alho e Óleo',
                kcal: '320 kcal',
                time: '15 min',
                image: Image.asset('assets/images/recipes/macarrao.jpg'),
                bookmarked: true,
              ),
              RecipeCard(
                title: 'Bolo de Cenoura',
                kcal: '280 kcal',
                time: '55 min',
                image: Image.asset('assets/images/recipes/bolo.jpg'),
                bookmarked: false,
              ),
            ],
          ),
          SizedBox(height: 20,),
          RecipeCarousell(
            title: 'Top fitness',
            subtitle: 'Ver mais',
            recipes: [
              RecipeCard(
                title: 'Espaguete de Abobrinha',
                kcal: '280 kcal',
                time: '15 min',
                image: Image.asset('assets/images/recipes/espaguete.jpg'),
                bookmarked: false,
              ),
              RecipeCard(
                title: 'Salada de Frango',
                kcal: '130 kcal',
                time: '20 min',
                image: Image.asset('assets/images/recipes/salada.jpg'),
                bookmarked: false,
              ),
              RecipeCard(
                title: 'Wrap de Frango',
                kcal: '300 kcal',
                time: '20 min',
                image: Image.asset('assets/images/recipes/wrap.jpg'),
                bookmarked: false,
              ),
            ],
          )
        ],
      ),
    );
  }
}
