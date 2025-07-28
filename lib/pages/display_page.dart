import 'package:flutter/material.dart';
import 'package:kitchen_guide/pages/category/categories.dart';
import 'package:kitchen_guide/pages/homepage/home_page.dart';
import 'package:kitchen_guide/pages/profile/user_profile.dart';
import 'package:kitchen_guide/pages/search/search.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  int selectedIndex = 0;

  var pages = [
    HomePage(),
    Search(),
    Categories(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: buildNavigatorBar(),
    );
  }

  buildNavigatorBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      onTap: (index){
        setState(() {
          selectedIndex = index;
        });
      },
      currentIndex: selectedIndex,
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
