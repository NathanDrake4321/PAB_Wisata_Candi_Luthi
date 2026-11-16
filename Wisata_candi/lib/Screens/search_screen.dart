import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/candi_data.dart';
import 'package:flutter_application_1/Models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TODO: 1. Declare the required variables
  List<Candi> _filteredCandis = [];
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Menampilkan semua data candi di awal sebelum user mengetik pencarian
    _filteredCandis = candiList;
  }

  @override
  void dispose() {
    // Membersihkan controller saat halaman ditutup
    _searchController.dispose();
    super.dispose();
  }

  void _filterCandis(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredCandis = candiList.where((candi) {
        return candi.name.toLowerCase().contains(_searchQuery) ||
            candi.location.toLowerCase().contains(_searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Create an appbar with the title Search Candi
      appBar: AppBar(
        title: const Text('Search Candi'),
      ),
      // TODO: 3. Create a body in the form of a Column
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            // TODO: 4. Create a search TextField as a child of Column
            child: TextField(
              controller: _searchController,
              onChanged: _filterCandis,
              decoration: InputDecoration(
                hintText: 'Cari candi...',
                prefixIcon: const Icon(Icons.search),
                // TODO: 7. Border & padding styling
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
              ),
            ),
          ),
          // TODO: 5. Create a search results ListView as a child of Column
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (context, index) {
                final candi = _filteredCandis[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      candi.imageAsset,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(candi.name),
                  subtitle: Text(candi.location),
                  onTap: () {
                    // Aksi ketika item diklik (misal: navigasi ke DetailScreen)
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}