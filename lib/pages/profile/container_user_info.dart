import 'package:flutter/material.dart';
import 'package:kitchen_guide/db/profile_dao.dart';
import 'package:kitchen_guide/domain/profile.dart';

class ContainerUserInfo extends StatefulWidget {
  const ContainerUserInfo({super.key});

  @override
  State<ContainerUserInfo> createState() => _ContainerUserInfoState();
}

class _ContainerUserInfoState extends State<ContainerUserInfo> {
  Profile? userProfile;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    ProfileDao profileDao = ProfileDao();
    userProfile = await ProfileDao().getProfileByEmail('example@gmail.com');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    /*Operadores null-aware (??) para fornecer valores padrão
    caso userProfile seja nulo (ou seja, se nenhum perfil foi encontrado).*/
    final String userName = userProfile?.nome ?? '...';
    final String userEmail = userProfile?.email ?? '...';
    final String userProfileImage = userProfile?.urlImage ?? '';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
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
        ]
      ),
      width: double.infinity,
      height: 130,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            // spacing: 2,
            children: [
              Text(
                userName,
                style: const TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                userEmail,
                style: const TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(userProfileImage, height: 95, width: 95),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
