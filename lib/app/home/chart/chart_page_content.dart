import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChartPageContent extends StatelessWidget {
  const ChartPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Look out your chart')]),
        ],
      ),
    );
  }
}
