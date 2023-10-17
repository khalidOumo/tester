import 'package:flutter/material.dart';
import 'package:my_project/constant.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Scane Page"),
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
      ),
      body: const Center(child: Text("Welcome to Scan Page")),
    );
  }
}