import 'package:flutter/material.dart';
import 'package:kitchen_guide/login/singUpPage.dart';
import 'package:kitchen_guide/pages/display_page.dart';
import 'package:kitchen_guide/pages/profile/options/subOptions/renameEmail.dart';
import 'package:kitchen_guide/pages/profile/options/subOptions/renameUser.dart';
import '../../../db/profile_dao.dart';

class ManageAccountOPT extends StatefulWidget {
  final String userEmail;
  const ManageAccountOPT({super.key, required this.userEmail});

  @override
  State<ManageAccountOPT> createState() => _ManageAccountOPTState();
}

class _ManageAccountOPTState extends State<ManageAccountOPT> {
  void _navigateToRenameUser() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RenameUser(userEmail: widget.userEmail)),
    );
    // Pode recarregar os dados do ManageAccountOPT se houver algum
  }

  void _navigateToRenameEmail() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RenameEmail(userEmail: widget.userEmail)),
    );
  }

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
                _navigateToRenameUser();
              },
            ),
            SizedBox(height: 15),
            buildContainer(
              Icons.alternate_email, 'Alterar E-mail',
              'Atualize seu endereço de e-mail.', () {
                _navigateToRenameEmail();
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
                showDeleteConfirmationDialog(widget.userEmail);
              },
            ),
          ],
        ),
      ),
    );
  }
  void showDeleteConfirmationDialog(String userEmail) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Excluir Conta'),
          content: const Text('Tem certeza que deseja excluir sua conta? Esta ação é irreversível.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirmar', style: TextStyle(color: Colors.red)),
              onPressed: () {
                _deleteUserAccount(userEmail);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteUserAccount(String userEmail) async {
    final profileDao = ProfileDao();
    int linhasExcluidas = await profileDao.deleteAccount(userEmail);

    if (linhasExcluidas > 0) {
      _showSnackBar('Sua conta foi excluída com sucesso.', isError: false);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SingUpPage(destinyPage: DisplayPage())),
        (Route<dynamic> route) => false, // Essa condição garante que todas as telas são removidas
      );
    } else {
      _showSnackBar('Erro ao excluir a conta. Tente novamente.', isError: true);
    }
  }

  void _showSnackBar(String message, {bool isError = true}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
