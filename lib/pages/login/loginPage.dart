import 'package:flutter/material.dart';
import 'package:kitchen_guide/pages/login/singUpPage.dart';

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
              decoration: InputDecoration(
                hintText: 'Nome de usuário',
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
    String userName = userController.text;
    String password = passwordController.text;

    if (userName.isEmpty || password.isEmpty) {
      _showSnackBar('Por favor, preencha todos os campos.');
      return;
    }
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black87,
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