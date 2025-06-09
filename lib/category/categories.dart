import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          buildCard('Nível de Habilidade', 'Fácil, Médio, Avançado', 'assets/images/categories/cat1.png'),
          buildCard('Tempo de Receita', 'Abaixo de 30 min, 1 hora ou mais', 'assets/images/categories/cat2.png'),
          buildCard('Dieta', 'Vegetariano, Não Vegano, Vegano', 'assets/images/categories/cat3.png'),
          buildCard('Culinária', 'Indiano, Chinesa, Italiana e mais', 'assets/images/categories/cat4.png'),
          buildCard('Cursos', 'Aperitivos, Pratos Principais e mais', 'assets/images/categories/cat5.png'),
          buildCard('Comida Saudável', 'Baixo em calorias e mais', 'assets/images/categories/cat6.png'),
        ],
      ),
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
      backgroundColor: Color(0xFFEF233C),
      title: Text(
        'Categorias',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
