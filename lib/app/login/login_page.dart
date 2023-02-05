import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skarbonka/app/home/home_page.dart';
import 'package:skarbonka/app/login/login_page.dart';
import 'package:skarbonka/app/welcome/welcome_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Zaloguj sie !', style: GoogleFonts.nunito(fontSize: 35)),
              SizedBox(height: 20),
              CircleAvatar(
                backgroundImage: AssetImage('images/piggy.png'),
                radius: 80,
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'E-mail',
                    border: OutlineInputBorder(),
                    label: Text('Login')),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    label: Text('Password')),
                obscureText: true,
              ),
              TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.toString(),
                      password: passwordController.toString(),
                    );
                  },
                  child: Text('Zarejestruj się ')),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.orange,
                ),
                iconSize: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
