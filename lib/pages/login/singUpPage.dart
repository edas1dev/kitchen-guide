import 'package:flutter/material.dart';
import 'package:kitchen_guide/db/profile_dao.dart';
import 'package:kitchen_guide/domain/profile.dart';
import 'package:kitchen_guide/pages/login/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpPage extends StatefulWidget {
  final Widget destinyPage;
  const SingUpPage({super.key, required this.destinyPage });

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
              'Cadastre-se no nosso app!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: userController,
              decoration: InputDecoration(
                hintText: 'Seu nome',
                focusedBorder: buildUserOutlineInputBorder(),
                border: buildUserOutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Seu e-mail',
                focusedBorder: buildPasswordOutlineInputBorder(),
                border: buildPasswordOutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Sua senha',
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
              onPressed: onSingUpPressed,
              child: Text(
                'Cadastrar', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(destinyPage: widget.destinyPage,)),
                );
              }, child: Text('Fazer login',
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

  void onSingUpPressed() async {
    String userName = userController.text;
    String emailUser = emailController.text;
    String password = passwordController.text;

    if (userName.isEmpty || password.isEmpty || emailUser.isEmpty) {
      _showSnackBar('Por favor, preencha todos os campos.', isError: true);
      return;
    }

    Profile profile = Profile(nome: userName, email: emailUser, password: password, urlImage: 'assets/images/profile_person.jpg');
    await ProfileDao().insertProfile(profile);
    _showSnackBar('Usuário cadastrado com sucesso!', isError: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserLogged', true);
    await prefs.setString('loggedUserEmail', emailUser);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget.destinyPage));
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
