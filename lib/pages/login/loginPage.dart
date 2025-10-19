import 'package:flutter/material.dart';
import 'package:kitchen_guide/pages/login/singUpPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/profile_api.dart';
import '../../db/profile_dao.dart';
import '../../domain/profile.dart';

class LoginPage extends StatefulWidget {
  final Widget destinyPage;
  const LoginPage({super.key, required this.destinyPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            Text(
              'Entre ou cadastre-se no app!', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: userController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                focusedBorder: buildUserOutlineInputBorder(),
                border: buildUserOutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Senha',
                focusedBorder: buildPasswordOutlineInputBorder(),
                border: buildPasswordOutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEF233C),
                padding: EdgeInsets.all(10),
              ),
              onPressed: onPressedLogon, child: Text(
                'Entrar', style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEF233C),
                padding: EdgeInsets.all(10),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SingUpPage(destinyPage: widget.destinyPage,)),
                );
              }, child: Text('Cadastre-se', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  void onPressedLogon() async {
    String userEmail = userController.text.trim();
    String password = passwordController.text.trim();

    if (userEmail.isEmpty || password.isEmpty) {
      _showSnackBar('Por favor, preencha todos os campos.', isError: true);
      return;
    }

    try {
      final profileApi = ProfileApi();
      final profileDao = ProfileDao();

      Map<String, dynamic>? profileMap;
      bool loginSuccess = false;
      try {
        profileMap = await profileApi.fetchProfileByEmail(userEmail);
        if (profileMap['password'] == password) {
          loginSuccess = true;
        }
      } catch (e) {
        print('Usuário não encontrado na API, tentando banco local...');
      }

      if (!loginSuccess) {
        bool isValidLocal = await profileDao.validateUser(userEmail, password);
        if (isValidLocal) {
          loginSuccess = true;
          Profile? localProfile = await profileDao.getProfileByEmail(userEmail);
          if (localProfile != null) {
            profileMap = localProfile.toJson();
          } else {
            loginSuccess = false;
          }
        }
      }

      if (loginSuccess && profileMap != null) {
        _showSnackBar('Login realizado com sucesso!', isError: false);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isUserLogged', true);
        await prefs.setString('loggedUserEmail', userEmail);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => widget.destinyPage),
        );
      } else {
        _showSnackBar('Usuário ou senha inválidos.', isError: true);
      }
    } catch (e) {
      print('Erro no login: $e');
      _showSnackBar('Erro ao realizar login. Tente novamente.', isError: true);
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
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }

  OutlineInputBorder buildUserOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }
}