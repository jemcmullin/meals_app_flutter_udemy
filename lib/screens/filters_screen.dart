import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function handleSave;
  final Map<String, bool> setFilters;

  FiltersScreen(this.handleSave, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _filterForVegan = false;
  var _filterForVegetarian = false;
  var _filterForLactoseFree = false;
  var _filterForGlutenFree = false;

  @override
  void initState() {
    super.initState();
    _filterForVegan = widget.setFilters['vegan'];
    _filterForVegetarian = widget.setFilters['vegetarian'];
    _filterForLactoseFree = widget.setFilters['lactoseFree'];
    _filterForGlutenFree = widget.setFilters['glutenFree'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save_outlined),
              onPressed: () {
                final selectedFilters = {
                  'vegan': _filterForVegan,
                  'vegetarian': _filterForVegetarian,
                  'glutenFree': _filterForGlutenFree,
                  'lactoseFree': _filterForLactoseFree,
                };
                widget.handleSave(selectedFilters);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text('Adjust meal selection preference',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile.adaptive(
                  title: Text('Vegan'),
                  subtitle: Text('Filter for vegan options'),
                  value: _filterForVegan,
                  onChanged: (newValue) {
                    setState(() {
                      _filterForVegan = newValue;
                    });
                  },
                ),
                SwitchListTile.adaptive(
                  title: Text('Vegetarian'),
                  subtitle: Text('Filter for Vegetarian options'),
                  value: _filterForVegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _filterForVegetarian = newValue;
                    });
                  },
                ),
                SwitchListTile.adaptive(
                  title: Text('Gluten Free'),
                  subtitle: Text('Filter for gluten free options'),
                  value: _filterForGlutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _filterForGlutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile.adaptive(
                  title: Text('Lactose Free'),
                  subtitle: Text('Filter for lactose free options'),
                  value: _filterForLactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _filterForLactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
