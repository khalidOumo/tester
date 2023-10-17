import 'package:flutter/material.dart';

class PersonneScreen extends StatefulWidget {
  const PersonneScreen({super.key});

  @override
  State<PersonneScreen> createState() => _PersonneScreenState();
}

class _PersonneScreenState extends State<PersonneScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page Personne'),
    );
  }
}