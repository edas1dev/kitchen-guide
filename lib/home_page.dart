import 'package:flutter/material.dart';
import 'package:kitchen_guide/bottom_app_bar.dart';

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
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
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
            SizedBox(height: 20,),
            Container(
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
            Row(
              children: [
                Text('Trending hoje!', style:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Spacer(),
                Text('Ver tudo', style:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFFEF233C)),
                ),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return buildRecipe('Roberto Coxinha', '90 kcal', '30 min', 'assets/images/profile_person.jpg');
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}

buildRecipe(String title, String kcal, String time, String image) {
  return Container(
    decoration: BoxDecoration(
      color: Color.fromRGBO(229, 222, 209, 0.5),
      borderRadius: BorderRadius.circular(16),
    ),
    margin: EdgeInsets.only(right: 24),
    padding: EdgeInsets.all(25),
    width: 200,
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            image,
            height: 120,
            width: 120,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.fastfood),
                    Text(kcal)
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.timer),
                    Text(time)
                  ],
                )
              ],
            ),
            Spacer(),
            Icon(Icons.bookmark, size: 40)
          ],
        )
      ],
    ),
  );
}