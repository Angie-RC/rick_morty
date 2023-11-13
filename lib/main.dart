import 'package:flutter/material.dart';
import 'package:rick_morty/screens/character_list.dart';
import 'package:rick_morty/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData.light(),
       darkTheme: ThemeData.dark(),
       home: const Home()
    );
  }
}
