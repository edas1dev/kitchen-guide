import 'package:flutter/material.dart';
import 'package:kitchen_guide/pages/profile/container_user_info.dart';
import 'package:kitchen_guide/pages/profile/options/helpCenterOpt.dart';
import 'package:kitchen_guide/pages/profile/options/manageAccountOpt.dart';
import 'package:kitchen_guide/pages/profile/options/savedRecipesOpt.dart';
import 'package:kitchen_guide/pages/profile/options/settingsOpt.dart';
import '../../db/profile_dao.dart';
import '../../domain/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile? userProfile;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final profileDao = ProfileDao();
    final profile = await profileDao.getFirstUser();
    setState(() {
      userProfile = profile;
    });
  }

  void _navigateToManageAccount() async {
    if (userProfile != null) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ManageAccountOPT(userEmail: userProfile!.email)),
      );
      _loadUserProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Column(
          children: [
            ContainerUserInfo(userProfile: userProfile),
            const SizedBox(height: 30),
            buildContainer(
              Icons.bookmark, 'Receitas salvas', 'Suas receitas salvas aqui.', () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => const SavedRecipesOPT()),
              );
            },
            ),
            const SizedBox(height: 15),
              buildContainer(
                Icons.manage_accounts, 'Gerenciar conta', 'Edite com detalhes a sua conta.', () {
                _navigateToManageAccount();
              },
            ),
            const SizedBox(height: 15),
              buildContainer(
                Icons.settings, 'Configurações', 'Algumas configurações do App.', () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const SettingsOPT()),
                );
              },
            ),
            const SizedBox(height: 15),
            buildContainer(
              Icons.headset_mic_rounded, 'Central de ajuda', 'Entre em contato com o suporte.', () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const HelpCenterOPT()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

buildContainer(IconData icon, String titulo, String subtitulo, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(13),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
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
      height: 80,
      child: Row(
        children: [
          Icon(icon, size: 40, color: Color(0xFFEF233C)),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text(subtitulo),
            ],
          )
        ],
      ),
    ),
  );
}
