import 'package:flutter/material.dart';

import 'Breaking News.dart';
import 'Search News.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final _pages = [BreakingNews(), SearchScreen()];
  final _pageTitle = ["Breaking News", "Search News"];

  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _pageTitle[_selectedPageIndex],
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey,
          currentIndex: _selectedPageIndex,
          iconSize: 30,
          selectedFontSize: 13,
          unselectedFontSize: 13,
          items: const [
            BottomNavigationBarItem(
                label: "Breaking News", icon: Icon(Icons.inbox)),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            )
          ]),
    );
  }
}
