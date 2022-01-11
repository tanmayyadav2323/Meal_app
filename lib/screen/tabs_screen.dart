import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import './categories_screenview.dart';
import './favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> pages = [
    {'page': CategoriesView(), 'title': 'Categories'},
    {'page': FavoriteScreen(), 'title': 'Your Favorite'}
  ];
  int selectedPage = 0;
  void selectPage(int index) {
    setState(() {
      selectedPage = index;
    });
    //the index is automatically passed in by flutter
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPage]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          selectedFontSize: 18,
          unselectedFontSize: 13,
          currentIndex: selectedPage,
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.shifting,
          // ignore: deprecated_member_use
          onTap: selectPage, //flutter will automatically give the index
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                title: Text('Categories')),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.favorite),
                title: Text('Favorite'))
          ]),
    );
  }
}

//with default tab controller we don't need a stateful widget
