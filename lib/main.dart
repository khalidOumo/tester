import 'package:flutter/material.dart';
import 'package:my_project/Screens/HomeScreen.dart';
import 'package:my_project/Screens/WelcomePage.dart';
import 'package:my_project/widgets/TobarPage.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cours flutter",
      theme: ThemeData(),
      home: const WelcomePage(),
    );
  }
}