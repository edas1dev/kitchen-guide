
import 'package:flutter/material.dart';
import 'package:kitchen_guide/domain/category.dart';
import 'package:kitchen_guide/pages/category/recipes_list.dart';

import '../../api/categories_api.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<Category>> listaCategorias;
  @override
  void initState() {
    super.initState();
    listaCategorias = CategoriesApi().findAll();
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
    return FutureBuilder(
      future: listaCategorias,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Category> listaCategorias = snapshot.requireData;
          return ListView.builder(
            padding: EdgeInsets.only(top: 15),
            itemCount: listaCategorias.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: buildCard(listaCategorias[i])
              );
          });
        }

        return Center(
            child: CircularProgressIndicator(
              color: Color(0xFFE41D56),
            ));
      },
    );
  }

  buildCard(Category categoria) {
    return InkWell(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => RecipeList(category: categoria)
        ));
      },
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD9D9D9).withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, 4),
            )
          ]),
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 16),
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
                    categoria.titulo,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    categoria.subtitulo,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
              child: Image.asset(
                categoria.url,
                height: 80,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
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
