import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensePageContent extends StatelessWidget {
  const ExpensePageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Home Page')]),
        ],
      ),
    );
  }
}