import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/candi_data.dart';
import 'package:flutter_application_1/Models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});


  @override
  State<SearchScreen> createState() => _SearchScreenState();
  List<Candi> filteredCandi = [];
  String searchQuery = '';
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
    appBar: Appbar(context)
  };

}
