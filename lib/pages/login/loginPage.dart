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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.kitchen_rounded, color: const Color(0xFFEF233C), size: 80),
              const SizedBox(height: 20),
              Text('Bem-vindo de volta!', style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2B2D42),
              )),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFFEF233C)),
                        hintText: 'E-mail',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: const Color(0xFFEF233C).withOpacity(0.8)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        filled: true, fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFEF233C)),
                        hintText: 'Senha',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: const Color(0xFFEF233C).withOpacity(0.8)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        filled: true, fillColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF233C),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 130),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                ),
                onPressed: onLogonPressed,
                child: Text('Entrar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => SingUpPage(destinyPage: widget.destinyPage),
                    ),
                  );
                }, child: Text(
                    'Não tem conta? Crie agora mesmo', style: TextStyle(
                    color: Color(0xFF2B2D42),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLogonPressed() async {
    String userEmail = emailController.text.trim();
    String password = passwordController.text.trim();

    if (userEmail.isEmpty || password.isEmpty) {
      _showSnackBar('Preencha todos os campos.', isError: true);
      return;
    }

    try {
      final profileApi = ProfileApi();
      final profileDao = ProfileDao();

      Profile? profileMap;
      bool loginSuccess = false;
      try {
        profileMap = await profileApi.fetchProfileByEmail(userEmail);
        if (profileMap.password == password) {
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
            profileMap = localProfile;
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget.destinyPage));
      } else {
        _showSnackBar('Usuário ou senha inválidos.', isError: true);
      }
    } catch (e) {
      _showSnackBar('Erro ao realizar login.', isError: true);
    }
  }

  void _showSnackBar(String message, {required bool isError}) {
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: isError ? Colors.black87 : Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}