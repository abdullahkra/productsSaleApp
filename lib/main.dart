import 'package:flutter/material.dart';
import 'package:gorev_emre_hoca/screens/home_page.dart';

void main() {
  runApp(const GorevEmreHoca());
}

class GorevEmreHoca extends StatelessWidget {
  const GorevEmreHoca({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gorev Emre Hoca',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}
