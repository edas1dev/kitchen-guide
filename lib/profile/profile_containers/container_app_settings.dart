import 'package:flutter/material.dart';

class ContainerAppSettings extends StatefulWidget {
  const ContainerAppSettings({super.key});

  @override
  State<ContainerAppSettings> createState() => _ContainerAppSettingsState();
}

class _ContainerAppSettingsState extends State<ContainerAppSettings> {
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
          Icon(Icons.settings, size: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Configurações', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text('Algumas configurações do App.'),
            ],
          )
        ],
      ),
    );
  }
}
