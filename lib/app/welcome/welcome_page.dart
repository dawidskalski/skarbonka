import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skarbonka/app/login/login_page.dart';

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
                Text(
                  'Nazywam się sakorbonka! Jestem tu po to aby pomóc ci w kontrolowaniu twoich wydatków.',
                  style: GoogleFonts.lato(fontSize: 15),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/piggy.png'),
                  radius: 100,
                ),
                IconButton(
                  iconSize: 37,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.orange,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
