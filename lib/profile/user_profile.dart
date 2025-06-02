import 'package:flutter/material.dart';
import 'package:kitchen_guide/bottom_app_bar.dart';
import 'package:kitchen_guide/profile/profile_containers/container_app_settings.dart';
import 'package:kitchen_guide/profile/profile_containers/container_help_center.dart';
import 'package:kitchen_guide/profile/profile_containers/container_manage_account.dart';
import 'package:kitchen_guide/profile/profile_containers/container_saved_recipes.dart';
import 'package:kitchen_guide/profile/profile_containers/container_user_info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ContainerUserInfo(),
            SizedBox(height: 30),
            ContainerSavedRecipes(),
            SizedBox(height: 3),
            ContainerManageAccount(),
            SizedBox(height: 3),
            ContainerAppSettings(),
            SizedBox(height: 3),
            ContainerHelpCenter(),
          ],
        ),
      ),
    );
  }
}
