import '../models/meals.dart';
import '../screens/categories_screen.dart';
import '../widgets/main_drawer.dart';
import './favorite_screens.dart';
import 'package:flutter/material.dart';

class TabScreens extends StatefulWidget {

  final List<Meals> favoriteMeals;

  const TabScreens(this.favoriteMeals, {super.key});

  @override
  State<TabScreens> createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  late List<Map<String, Object>> _pages;
  int _selectedPagesIndex = 0;

  @override
  void initState() {
    _pages = [
     {
       'page': const CategoriesScreen(),
       'title': 'Categories',
     },
     {
       'page':  FavoriteScreens(widget.favoriteMeals),
       'title': 'Your Favorites',
     }
   ];
    super.initState();
  }
  void _selectPage(int index) {
    setState(() {
      _selectedPagesIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPagesIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: (_pages[_selectedPagesIndex]['page'] as Widget),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).errorColor,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPagesIndex,
        // type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(
              Icons.category,
            ),
            label: ('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: ('Favorites'),
            backgroundColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
