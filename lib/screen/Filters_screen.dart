import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routename = '/Filters';
  Function savedFilter;
  Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.savedFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _gluteneFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  void initState() {
    _gluteneFree = widget.currentFilters['glutene'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];

    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwicthListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'glutene': _gluteneFree,
                  'lactose': _vegetarian,
                  'vegan': _vegan,
                  'vegetarian': _lactoseFree,
                };

                return widget.savedFilter(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwicthListTile('Glutene-Free',
                  'Only include glutene free meals', _gluteneFree, (newValue) {
                setState(() {
                  _gluteneFree = newValue;
                });
              }),
              _buildSwicthListTile('Lactose-Free',
                  'Only include lactose free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwicthListTile(
                  'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwicthListTile('Vegan', 'Only include vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
