import 'package:flutter/material.dart';

class ContainerUserInfo extends StatefulWidget {
  const ContainerUserInfo({super.key});

  @override
  State<ContainerUserInfo> createState() => _ContainerUserInfoState();
}

class _ContainerUserInfoState extends State<ContainerUserInfo> {
  @override
  Widget build(BuildContext context) {
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
            spacing: 2,
            children: [
              Text(
                'Exemplo da Silva',
                style: TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'exemple@gmail.com',
                style: TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  //'https://i.pinimg.com/236x/05/ab/3f/05ab3f93b3c22b80d9128532fd0fe2a6.jpg',
                  'assets/images/profile_person.jpg',
                  height: 95, width: 95,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
