import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      //  initialIndex: 1,  we can use it to choose which screen has to start
      child: Scaffold(
        appBar: AppBar(
          title: Text("meals"),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: "Categories",
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: "Favorites",
            ),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavoritesScreen(),
        ]),
      ),
    );
  }
}
