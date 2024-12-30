import 'package:flutter/material.dart';

class PreWeddingScreen extends StatefulWidget {
  const PreWeddingScreen({super.key});

  @override
  State<PreWeddingScreen> createState() => _PreWeddingScreenState();
}

class _PreWeddingScreenState extends State<PreWeddingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Pre-wedding Screen")),
    );
  }
}