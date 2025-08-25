import 'package:flutter/material.dart';
import 'package:kitchen_guide/db/tag_dao.dart';
import '../../domain/tag.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController searchBarController = TextEditingController();
  List<Tag> listaPopularTags = [];
  List<Tag> listaRecentTags = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaPopularTags = await TagDao().listarPopularTags();
    listaRecentTags = await TagDao().listarRecentTags();

    setState(() {});
  }

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
                controller: searchBarController,
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
              children: listaRecentTags.map<Widget>((tag) => buildTag(tag.nome)).toList()
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
              children: listaPopularTags.map<Widget>((tag) => buildTag(tag.nome)).toList()
            ),
            ],),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                  onPressed: () async {
                    if (searchBarController.text.isEmpty)
                      return;
                    List<String> searchText = searchBarController.text.split(', ');
                    for (String nomeTag in searchText) {
                      await TagDao().insertRecentTag(Tag(nome: nomeTag));
                    }
                    await loadData();
                    setState(() {});
                  },
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
    return InkWell(
      onTap: () {
        if (searchBarController.text.contains(titulo)) {
          return;
        }
        String add = searchBarController.text.isEmpty ? '' : ', ';
        searchBarController.text += add + titulo;
      },
      child: Container(
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
      ),
    );
  }
}

