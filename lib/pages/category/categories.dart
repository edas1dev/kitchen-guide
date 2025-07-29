import 'package:flutter/material.dart';
import 'package:kitchen_guide/db/categories_dao.dart';
import '../../domain/category.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Category> listaCategorias = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaCategorias = await CategoriesDao().listarPropriedades();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: listaCategorias.length,
        itemBuilder: (context, i) {
          return buildCard(
            listaCategorias[i].titulo,
            listaCategorias[i].subtitulo,
            listaCategorias[i].url
          );
        }
      )
    );
  }

  buildCard(String titulo, String descricao, String imagem) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  descricao,
                  style: TextStyle(color: Colors.grey[700]),
                ),

              ],
            ),
          ),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              imagem,
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      // backgroundColor: Color(0xFFEF233C),
      title: Text(
        'Categorias',
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
