import 'package:flutter/material.dart';
import '../../../../db/profile_dao.dart';

class RenameEmail extends StatefulWidget {
  final String userEmail;
  const RenameEmail({super.key, required this.userEmail});

  @override
  State<RenameEmail> createState() => _RenameEmailState();
}

class _RenameEmailState extends State<RenameEmail> {
  TextEditingController userEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, backgroundColor: Colors.white,
        title: Text('Renomear email', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
              controller: userEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Novo email',
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
              onPressed: onPressedRenameEmail,
              child: Text(
                'Alterar email',
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

  void onPressedRenameEmail() async {
    String newEmail = userEmailController.text;

    if (newEmail.isEmpty) {
      _showSnackBar('Por favor, preencha o novo email.', isError: true);
      return;
    }

    ProfileDao profileDao = ProfileDao();
    int linhasAfetadas = await profileDao.updateUserEmail(widget.userEmail, newEmail);

    if (linhasAfetadas > 0) {
      _showSnackBar('Seu email foi atualizado com sucesso!', isError: false);
      userEmailController.clear();
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
