import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skarbonka/app/login/login_page.dart';
import 'package:skarbonka/main.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('#Skarbonka', style: GoogleFonts.nunitoSans()),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Witaj!',
                    style: GoogleFonts.actor(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    child: Text(
                      'Nazywam się sakorbonka! Jestem tu po to aby pomóc ci w kontrolowaniu twoich wydatków.',
                      style: GoogleFonts.lato(fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/piggy.png'),
                    radius: 100,
                  ),
                  const SizedBox(height: 40),
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => RootPage()));
                    },
                    icon: Icon(
                      Icons.arrow_right_alt_sharp,
                      color: Colors.orange,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
