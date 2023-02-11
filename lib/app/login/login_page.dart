import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final name = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '#Skarbonka',
          style: GoogleFonts.nunitoSans(),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isCreatingAccount == false
                      ? 'Zaloguj sie !'
                      : 'Zarejestruj się'),
                  SizedBox(height: 20),
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/piggy.png'),
                    radius: 80,
                  ),
                  const SizedBox(height: 20),

                  /*  ------------------------------------------------- Dodawanie imienia                        
                   if (isCreatingAccount == true) ...[
                    TextField(
                      controller: widget.name,
                      decoration: InputDecoration(
                          hintText: 'What your name ?',
                          border: OutlineInputBorder(),
                          label: Text('name')),
                    ),
                  ],
                  */

                  const SizedBox(height: 10),
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
                        hintText: 'Choose your password',
                        border: OutlineInputBorder(),
                        label: Text('Password')),
                    obscureText: true,
                  ),
                  Text(errorMessage),
                  IconButton(
                    onPressed: () async {
                      if (isCreatingAccount == false) {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: widget.emailController.text,
                            password: widget.passwordController.text,
                          );
                        } catch (error) {
                          setState(() {
                            errorMessage = error.toString();
                          });
                        }
                      } else {
                        try {
                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: widget.emailController.text,
                              password: widget.passwordController.text);
                        } catch (error) {
                          setState(() {
                            errorMessage = error.toString();
                          });
                        }
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.orange,
                    ),
                    iconSize: 50,
                  ),
                  SizedBox(height: 20),
                  if (isCreatingAccount == false) ...[
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isCreatingAccount = true;
                        });
                      },
                      child: Text('Utwórz konto'),
                    )
                  ],
                  if (isCreatingAccount == true) ...[
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isCreatingAccount = false;
                        });
                      },
                      child: Text('Mam już konto'),
                    )
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
