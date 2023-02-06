import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';

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
              const CircleAvatar(
                backgroundImage: AssetImage('images/piggy.png'),
                radius: 80,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: widget.emailController,
                decoration: const InputDecoration(
                    hintText: 'E-mail',
                    border: OutlineInputBorder(),
                    label: Text('Login')),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: widget.passwordController,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    label: Text('Password')),
                obscureText: true,
              ),
              Text(errorMessage),
              IconButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: widget.emailController.text,
                      password: widget.passwordController.text,
                    );
                  } catch (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
                  }
                },
                icon: const Icon(
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
