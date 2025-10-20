import 'package:flutter/material.dart';
import 'package:kitchen_guide/domain/profile.dart';

class ContainerUserInfo extends StatelessWidget {
  final Profile? userProfile;
  const ContainerUserInfo({super.key, this.userProfile});
  static const String defaultUrl = 'assets/images/default_pfp.jpg';

  @override
  Widget build(BuildContext context) {
    final String userName = userProfile?.nome ?? '...';
    final String userEmail = userProfile?.email ?? '...';
    final String userProfileImage = userProfile?.urlImage ?? defaultUrl;
    final String finalImage = (userProfileImage.isEmpty || userProfileImage == defaultUrl) ? defaultUrl : userProfileImage;
    final bool isNetworkImage = finalImage.startsWith('http') || finalImage.startsWith('https');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName, style: TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                ),
                const SizedBox(height: 2),
                Text(
                  userEmail, style: TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: isNetworkImage ? Image.network(
              finalImage, width: 95, height: 95, fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(defaultUrl, width: 95, height: 95, fit: BoxFit.cover);
              },
            ) : Image.asset(finalImage, width: 95, height: 95, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}