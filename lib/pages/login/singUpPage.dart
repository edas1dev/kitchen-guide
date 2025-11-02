import 'package:flutter/material.dart';
import 'package:kitchen_guide/api/profile_api.dart';
import 'package:kitchen_guide/db/profile_dao.dart';
import 'package:kitchen_guide/domain/profile.dart';
import 'package:kitchen_guide/pages/login/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpPage extends StatefulWidget {
  final Widget destinyPage;
  const SingUpPage({super.key, required this.destinyPage});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final TextEditingController userController = TextEditingController();
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
              Icon(Icons.person_add_alt_1_rounded, color: const Color(0xFFEF233C), size: 80),
              const SizedBox(height: 20),
              Text(
                'Crie sua conta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2B2D42),
                ),
              ),
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
                      controller: userController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline, color: Color(0xFFEF233C)),
                        hintText: 'Seu nome',
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFFEF233C)),
                        hintText: 'Seu e-mail',
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
                        hintText: 'Sua senha',
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
                onPressed: onSingUpPressed,
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(destinyPage: widget.destinyPage)));
                }, child: const Text(
                  'Já tem conta? Fazer login',
                  style: TextStyle(
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

  void onSingUpPressed() async {
    String userName = userController.text.trim();
    String emailUser = emailController.text.trim();
    String password = passwordController.text.trim();

    if (userName.isEmpty || password.isEmpty || emailUser.isEmpty) {
      _showSnackBar('Preencha todos os campos.', isError: true);
      return;
    }

    final ProfileApi profileApi = ProfileApi();
    final Profile profile = Profile(
      nome: userName,
      email: emailUser,
      password: password,
      urlImage: profileApi.getRandomAvatar(),
    );

    await ProfileDao().insertProfile(profile);
    _showSnackBar('Usuário cadastrado com sucesso!', isError: false);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserLogged', true);
    await prefs.setString('loggedUserEmail', emailUser);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget.destinyPage));
  }

  void _showSnackBar(String message, {required bool isError}) {
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: isError ? Colors.black87 : Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
