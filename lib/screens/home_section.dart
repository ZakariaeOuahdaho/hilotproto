import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Accueil',
          style: TextStyle(fontSize: 24, color: Colors.blue[800]),
        ),
      ),
    );
  }
}