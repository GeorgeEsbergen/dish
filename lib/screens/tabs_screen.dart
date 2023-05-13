// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/drawer_screen.dart';
import 'categories_screen.dart';
import 'favorites.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favourites;

  TabsScreen(this.favourites);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map>? _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favourites),
        'title': 'Favorites',
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages![_selectedPageIndex]['title'])),
      body: _pages![_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(color: Colors.red),
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Favorites',
          ),
        ],
      ),
      drawer: DrawerScreen(),
    );
  }
}
