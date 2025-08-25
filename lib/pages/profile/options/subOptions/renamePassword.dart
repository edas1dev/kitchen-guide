import 'package:flutter/material.dart';
import 'package:kitchen_guide/db/profile_dao.dart';

class RenamePassword extends StatefulWidget {
  final String userEmail;
  const RenamePassword({super.key, required this.userEmail});

  @override
  State<RenamePassword> createState() => _RenamePasswordState();
}

class _RenamePasswordState extends State<RenamePassword> {
  TextEditingController userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, backgroundColor: Colors.white,
        title: Text('Renomear senha', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            TextField(
              controller: userPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Nova senha',
                focusedBorder: buildUserOutlineInputBorder(),
                border: buildUserOutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEF233C),
                padding: const EdgeInsets.all(10),
              ),
              onPressed: onPressedRename,
              child: Text(
                'Renomear',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressedRename() async {
    String newPassword = userPasswordController.text;

    if (newPassword.isEmpty) {
      _showSnackBar('Por favor, preencha o campo corretamente.', isError: true);
      return;
    }

    ProfileDao profileDao = ProfileDao();
    int linhasAfetadas = await profileDao.updateUserPassword(widget.userEmail, newPassword);

    if (linhasAfetadas > 0) {
      _showSnackBar('Sua senha foi atualizada com sucesso!', isError: false);
      userPasswordController.clear();
      Navigator.pop(context);
    } else {
      _showSnackBar('Erro ao atualizar. Tente novamente.', isError: true);
    }
  }

  void _showSnackBar(String message, {required bool isError}) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: isError ? Colors.black87 : Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  OutlineInputBorder buildPasswordOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }

  OutlineInputBorder buildUserOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }
}