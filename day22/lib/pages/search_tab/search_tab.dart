import 'package:day22/pages/widgets/index.dart';
import 'package:day22/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/index.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Column(
          children: [
            const BottomTabTitle('Search'),
            const SizedBox(height: 15),
            CupertinoSearchTextField(
              controller: _searchController,
              placeholder: 'Search',
              padding: const EdgeInsets.all(10),
              style: const TextStyle(fontSize: 16),
              decoration: BoxDecoration(
                color:
                    isDarkMode(context) ? Colors.grey[800] : Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SearchedUserList(searchText: _searchController.value.text),
          ],
        ),
      ),
    );
  }
}
