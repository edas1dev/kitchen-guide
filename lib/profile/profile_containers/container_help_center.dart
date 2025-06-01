import 'package:flutter/material.dart';

class ContainerHelpCenter extends StatefulWidget {
  const ContainerHelpCenter({super.key});

  @override
  State<ContainerHelpCenter> createState() => _ContainerHelpCenterState();
}

class _ContainerHelpCenterState extends State<ContainerHelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          ]
      ),
      width: double.infinity,
      height: 80,
      child: Row(
        spacing: 10,
        children: [
          Icon(Icons.headset_mic, size: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Central de ajuda', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text('Entre em contato com o suporte.'),
            ],
          )
        ],
      ),
    );
  }
}
