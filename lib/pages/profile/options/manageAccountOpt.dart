import 'package:flutter/material.dart';

class ManageAccountOPT extends StatefulWidget {
  const ManageAccountOPT({super.key});

  @override
  State<ManageAccountOPT> createState() => _ManageAccountOPTState();
}

class _ManageAccountOPTState extends State<ManageAccountOPT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0, backgroundColor: Colors.white,
        title: Text('Gerenciar Conta', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: ListView(
          children: [
            buildContainer(
              Icons.drive_file_rename_outline,
              'Renomear nome de usuário', 'Reescreva o seu nome.', () {
              /*Navigator.push(
                context, MaterialPageRoute(builder: (context) => const SavedRecipesOPT()),
              );*/
            },
            ),
            SizedBox(height: 15),
            buildContainer(
              Icons.alternate_email, 'Alterar E-mail',
              'Atualize seu endereço de e-mail.', () {
                /* Navegar para a tela de alterar e-mail */
              },
            ),
            const SizedBox(height: 15),
            buildContainer(
              Icons.lock_outline, 'Alterar Senha', 'Mantenha sua conta segura.', () {
                /* Navegar para a tela de alterar senha */
              },
            ),
            const SizedBox(height: 15),
            buildContainer(
              Icons.delete_forever_outlined, 'Excluir Conta',
              'Esta ação é permanente.', () {
                // Adicionar um diálogo de confirmação aqui
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
