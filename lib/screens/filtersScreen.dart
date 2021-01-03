import 'package:flutter/material.dart';
import '../widgets/drawer_content.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = "/filters_screen";

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters["gluten"];
    _vegetarian = widget.currentFilters["vegetarian"];
    _vegan = widget.currentFilters["vegan"];
    _lactoseFree = widget.currentFilters["lactose"];
    super.initState();
  }

  Widget _buildFiltersList(
    String filterName,
    String subtitleDescription,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(filterName),
      value: currentValue,
      subtitle: Text(
        subtitleDescription, // "Only include gluten-free meals,",
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Map<String, bool> _selectedFilters = {
                "gluten": _glutenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
              };
              widget.saveFilters(_selectedFilters);
            },
          )
        ],
      ),
      drawer: DrawerContent(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust yoer meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildFiltersList(
                  "Guleten-free",
                  "Only include gluten-free meals",
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildFiltersList(
                  "Vegetarian",
                  "Only include vegetarian meals",
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildFiltersList(
                  "Vegan",
                  "Only include vegan meals",
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                _buildFiltersList(
                  "Lactose-Free",
                  "Only include Lactose-Free meals",
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
