import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kitchen_guide/db/profile_dao.dart';

import '../../../../provider/profile_provider.dart';

class RenameUser extends StatefulWidget {
  final String userEmail;
  const RenameUser({super.key, required this.userEmail});

  @override
  State<RenameUser> createState() => _RenameUserState();
}

class _RenameUserState extends State<RenameUser> {
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0, backgroundColor: Colors.white,
        title: Text('Renomear nome', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  hintText: 'Novo nome',
                  focusedBorder: buildUserOutlineInputBorder(),
                  border: buildUserOutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF233C),
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 130),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                  ),
                  onPressed: onPressedRename,
                  child: Text('Renomear', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressedRename() async {
    String newUserName = userNameController.text;

    if (newUserName.isEmpty) {
      _showSnackBar('Por favor, preencha o novo nome.', isError: true);
      return;
    }

    ProfileDao profileDao = ProfileDao();
    int linhasAfetadas = await profileDao.updateUserName(widget.userEmail, newUserName);

    if (linhasAfetadas > 0) {
      _showSnackBar('Nome de usuário atualizado com sucesso!', isError: false);
      try {
        context.read<ProfileProvider>().setUserName(newUserName);
      } catch (e) {
        throw Exception(e);
      }

      userNameController.clear();
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