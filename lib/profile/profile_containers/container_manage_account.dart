import 'package:flutter/material.dart';

class ContainerManageAccount extends StatefulWidget {
  const ContainerManageAccount({super.key});

  @override
  State<ContainerManageAccount> createState() => _ContainerManageAccountState();
}

class _ContainerManageAccountState extends State<ContainerManageAccount> {
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
        spacing: 15,
        children: [
          Icon(Icons.manage_accounts, size: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Gerenciar conta', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text('Edite com detalhes a sua conta.'),
            ],
          )
        ],
      ),
    );
  }
}
