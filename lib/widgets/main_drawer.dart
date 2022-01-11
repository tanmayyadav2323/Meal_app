import 'package:flutter/material.dart';
import 'package:meal_app/screen/Filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildTile(
      BuildContext context, String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: Theme.of(context).textTheme.headline6.fontFamily,
            fontSize: 24,
            fontWeight: FontWeight.w700),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            child: Text('Cooking Up!',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor)),
            width: double.infinity,
            height: 120,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 20,
          ),
          buildTile(context, 'Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(
                '/'); //to delete the existing page and add a new page
            //so that there are no pages on the stack
          }),
          buildTile(context, 'Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routename);
          })
        ],
      ),
    );
  }
}
