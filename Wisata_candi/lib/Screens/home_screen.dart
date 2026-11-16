import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/candi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wisata Candi')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

        ),

        padding: const EdgeInsets.all(8),
        itemCount: candilist.length,
        itemBuilder: (context, index) {
        },
      ),
    );
  }
}
