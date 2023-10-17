import 'package:flutter/material.dart';

class favoratScreen extends StatefulWidget {
  const favoratScreen({super.key});

  @override
  State<favoratScreen> createState() => _favoratScreenState();
}

class _favoratScreenState extends State<favoratScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page favorat'),
    );
  }
}