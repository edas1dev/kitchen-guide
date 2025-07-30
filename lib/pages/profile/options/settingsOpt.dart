import 'package:flutter/material.dart';

class SettingsOPT extends StatefulWidget {
  const SettingsOPT({super.key});

  @override
  State<SettingsOPT> createState() => _SettingsOPTState();
}

class _SettingsOPTState extends State<SettingsOPT> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Configurações do App', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: ListView(
          children: [
            buildSwitchContainer(
              Icons.notifications_outlined, 'Notificações', _notificationsEnabled,
                (bool value) {
                  setState(() {
                    _notificationsEnabled = value;
                });
                // Adicionar lógica para salvar esta preferência no dispositivo
              },
            ),
            const SizedBox(height: 15),
            buildContainer(
              Icons.dark_mode_outlined, 'Aparência',
              'Altere o tema do aplicativo', () {
                // Navegar para a tela de seleção de tema (Claro/Escuro)
              },
            ),
            const SizedBox(height: 15),
            buildContainer(
              Icons.straighten_outlined, 'Unidades de Medida',
              'Defina (ex: gramas, xícaras)', () {
                // Navegar para a tela de seleção de unidades
              },
            ),
            const SizedBox(height: 15),
            buildContainer(
              Icons.info_outline, 'Sobre o App',
              'Versão, licenças e termos de uso', () {
                // Navegar para a tela "Sobre"
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD9D9D9).withOpacity(0.5),
            spreadRadius: 4, blurRadius: 4, offset: const Offset(0, 4),
          )
        ]
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: const Color(0xFFEF233C)),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text(subtitulo),
            ],
          )
        ],
      ),
    ),
  );
}

buildSwitchContainer(IconData icon, String titulo, bool value, Function(bool) onChanged) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    height: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFD9D9D9).withOpacity(0.5),
          spreadRadius: 4, blurRadius: 4, offset: const Offset(0, 4),
        )
      ],
    ),
    child: Row(
      children: [
        Icon(icon, size: 40, color: const Color(0xFFEF233C)),
        const SizedBox(width: 15),
        Text(titulo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const Spacer(),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFFEF233C),
        ),
      ],
    ),
  );
}