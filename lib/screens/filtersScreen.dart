import 'package:flutter/material.dart';
import '../widgets/drawer_content.dart';

class FiltersScreen extends StatelessWidget {
  static const routName = "/filters_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      drawer: DrawerContent(),
      body: null,
    );
  }
}
