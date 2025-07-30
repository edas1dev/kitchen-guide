import 'package:flutter/material.dart';

class HelpCenterOPT extends StatefulWidget {
  const HelpCenterOPT({super.key});

  @override
  State<HelpCenterOPT> createState() => _HelpCenterOPTState();
}

class _HelpCenterOPTState extends State<HelpCenterOPT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0, backgroundColor: Colors.white,
        title: Text('Central de Suporte', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: ListView(
          children: [
            buildContainer(
              Icons.help_outline, 'Perguntas Frequentes (FAQ)',
              'Respostas para dúvidas mais comuns.', () {
                // Navegar para a tela de FAQ);
              },
            ),
            const SizedBox(height: 15),
            buildContainer(
              Icons.support_agent, 'Fale Conosco',
              'Envie mensagem à equipe de suporte.', () {
                // Implementar envio de e-mail, formulário ou link para WhatsApp
                // Achei de exemplo: launchUrl(Uri.parse('mailto:suporte@seusite.com'));
              },
            ),
            const SizedBox(height: 15),
            buildContainer(
              Icons.policy_outlined, 'Termos de Uso e Privacidade',
              'Leia nossas políticas e condições.', () {
                // Navegar para tela de termos ou abrir link externo
                // Achei de exemplo: launchUrl(Uri.parse('https://www.seusite.com/termos'));
              },
            ),
            const SizedBox(height: 15),
            buildContainer(
              Icons.info_outline, 'Sobre o Aplicativo',
              'Informações da versão e créditos.', () {
                // showAboutDialog(context: context, applicationName: 'Seu App', applicationVersion: '1.0.0');
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

