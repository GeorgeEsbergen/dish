import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class DrawerScreen extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function adad) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        adad();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              height: 120,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                'Cooking Up !',
                style: TextStyle(fontSize: 20),
              )),
          Divider(
            height: 0,
            color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meal', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
