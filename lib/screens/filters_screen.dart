import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _filterForVegan = false;
  var _filterForVegitarian = false;
  var _filterForLactoseFree = false;
  var _filterForGlutenFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
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
                  subtitle: Text('Filter for vegitarian options'),
                  value: _filterForVegitarian,
                  onChanged: (newValue) {
                    setState(() {
                      _filterForVegitarian = newValue;
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
