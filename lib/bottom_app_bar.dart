import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({super.key});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      onTap: (index){
        setState(() {
          selectIndex = index;
          /*if(selectIndex == 3){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          }*/
        });
      },
      currentIndex: selectIndex,
      showUnselectedLabels: true,
      selectedItemColor: Color(0xFFEF233C),
      unselectedItemColor: Colors.grey[700],
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Casa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: 'Categorias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          label: 'Perfil',
        ),
      ],
    );
  }
}
