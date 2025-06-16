import 'package:flutter/material.dart';
import 'package:kitchen_guide/bottom_app_bar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container( // Barra de pesqusa
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 25, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Colors.grey[200]
                ),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text("Milho")
                  ],
                  
                ),  
                
              )
              
            ],
            
          )


        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
