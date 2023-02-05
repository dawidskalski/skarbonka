import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skarbonka/app/home/home_page.dart';
import 'package:skarbonka/app/login/login_page.dart';
import 'package:skarbonka/app/welcome/welcome_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Text('Jesteś zalogowany jako ${user.email}')],
        ),
      ),
    );
  }
}
