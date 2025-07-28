import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
        ListView(
          children: [
            Container( // Barra de pesqusa
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
                  icon: Icon(Icons.add),
                  hintText: 'Adicionar ingredientes',
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Recentes", style: TextStyle(
                fontSize: 18
              ),),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                buildTag('Cenoura'),
                buildTag('Milho'),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Popular", style: TextStyle(
                  fontSize: 18
              ),),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                buildTag('Leite'),
                buildTag('Ovos'),
                buildTag('Pão'),
                buildTag('Frango'),
                buildTag('Cebola'),
                buildTag('Manteiga'),
                buildTag('Tomate'),
                buildTag('Açafrão'),
              ],
            ),
            ],),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF96167),
                  ),
                  child: Text('Gerar receita', style: TextStyle(
                      color: Colors.white
                  ),)
              ),
            ),
          )
        ]
      )
    );
  }

  buildTag(String titulo) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: EdgeInsets.only(left: 15, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.grey[200]
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add),
          Text(titulo)
        ],
      ),
    );
  }
}

