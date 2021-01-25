import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListItem(IconData listIcon, String label) {
    return ListTile(
      leading: Icon(listIcon, size: 26),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            alignment: Alignment.bottomLeft,
            height: 200,
            width: double.infinity,
            child: Text(
              'Meal Saver',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 20,
          ),
          _buildListItem(Icons.restaurant, 'Meals'),
          _buildListItem(Icons.settings, 'Filters'),
        ],
      ),
    );
  }
}
