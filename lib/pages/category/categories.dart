import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class _CategoriesState extends State<Categories> {
 Future<List<Category>> listaCategorias = [];
 @override
 void initState() {
   super.initState();
   listaCategorias = CategoriesDao().listarPropriedades();
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
       child: FutureBuilder(
         future: listaCategorias,
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             List<Category> listaCategorias = snapshot.requireData;
             return ListView.builder(
                 itemCount: listaCategorias.length,
                 itemBuilder: (context, i) {
                   return buildCard(
                       listaCategorias[i].titulo,
                       listaCategorias[i].subtitulo,
                       listaCategorias[i].url
                   );
                 });
             }


           return Center(
               child: CircularProgressIndicator(
                 color: Color(0xFFE41D56),
               ));
           },
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

