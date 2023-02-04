import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: WelcomePage(),
    );
  }
}

//------------------------------------------------------------------------------ RootPage
class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;

          if (user == null) {
            return Scaffold(
              body: Center(
                child: Column(
                  children: [Text('Jesteś nie zalogowany')],
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: Column(
                children: [Text('Jesteś zalogowany jako ${user.email}')],
              ),
            ),
          );
        });
  }
}

//------------------------------------------------------------------------------ WelcomePage
class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('skarbonka'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Witaj!',
                  style: GoogleFonts.actor(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  'Nazywam się sakorbonka! Jestem tu po to aby pomóc ci w kontrolowaniu twoich wydatków. Każde pieniąki które wydajesz na: zakupy, rachunki oraz tym podobne rzeczy, wrzucaj do mnie a dzieki temu będizesz na bierząco śledził ile wydałeś w danynm miesiącu. Dzieki mojej wspanialej pamięci mogę ci pokazywac ile zaoszczędzisz w danym miesiącu, wystarczy, że powiesz mi ile zarabiasz i ile chciał być zaoszczędzić. Także nie ma na co czekać, zaczynajmy !',
                  style: GoogleFonts.lato(fontSize: 15),
                ),
                Image(
                  image: AssetImage('images/piggy.png'),
                  width: 250,
                ),
                const SizedBox(height: 40),
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
      ),
    );
  }
}
