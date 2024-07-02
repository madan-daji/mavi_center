// search_widget.dart
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = []; // List to hold search results
  final List<String> _data = [
    // Mock data for search suggestions
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
    'Class 11',
    'Class 12',
    'IT',
    'Electrical Engineering',
    'Zeometric',
    'Nursary',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    _searchResults = []; // Clear search results
    super.dispose();
  }

  void _onSearchChanged() {
    // Filter the list of items based on the search query
    setState(() {
      _searchResults = _data
          .where((item) =>
              item.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              prefixIcon: Icon(Icons.search),
              labelText: "Search",
            ),
            onChanged: (text) => _onSearchChanged(),
          ),
        ),
        SizedBox(height: 10),
        if (_searchResults.isNotEmpty)
          ListView.builder(
            shrinkWrap: true, // Important to prevent infinite height error
            itemCount: _searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_searchResults[index]),
              );
            },
          ),
      ],
    );
  }
}
