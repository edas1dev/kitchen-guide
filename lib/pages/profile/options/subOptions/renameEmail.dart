import 'package:flutter/material.dart';
import '../../../../db/profile_dao.dart';

class RenameEmail extends StatefulWidget {
  final String userEmail;
  const RenameEmail({super.key, required this.userEmail});

  @override
  State<RenameEmail> createState() => _RenameEmailState();
}

class _RenameEmailState extends State<RenameEmail> {
  late TextEditingController userEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Renomeie o seu nome de usuário!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: userEmailController,
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
              child: const Text(
                'Alterar',
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

    // 1. Validação dos dados
    if (newEmail.isEmpty) {
      _showSnackBar('Por favor, preencha o novo nome.', isError: true);
      return;
    }

    // 2. Chamada assíncrona para o DAO
    ProfileDao profileDao = ProfileDao();
    // Usa o e-mail que foi passado no construtor
    int linhasAfetadas = await profileDao.updateUserEmail(widget.userEmail, newEmail);

    // 3. Lógica de sucesso ou erro
    if (linhasAfetadas > 0) {
      _showSnackBar('Seu email foi atualizado com sucesso!', isError: false);
      userEmailController.clear();
      // Volta para a tela anterior
      Navigator.pop(context);
    } else {
      _showSnackBar('Erro ao atualizar. Tente novamente.', isError: true);
    }
  }

  void _showSnackBar(String message, {required bool isError}) {
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
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
