import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../../../../db/profile_dao.dart';
import '../../../../provider/profile_provider.dart';
import '../../user_profile.dart';

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0, backgroundColor: Colors.white,
        title: Text('Renomear email', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                controller: userEmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Novo email',
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
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 120),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                  ),
                  onPressed: onPressedRenameEmail,
                  child: Text('Alterar email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('loggedUserEmail', newEmail);
      try {
        context.read<ProfileProvider>().setLoggedUserEmail(newEmail);
      } catch (e) {
        throw Exception(e);
      }
      userEmailController.clear();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));

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
