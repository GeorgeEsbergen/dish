import 'dart:core';
import 'package:flutter/material.dart';
import '../widgets/drawer_screen.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';
  final Function filters;
  final Map<String, bool> currentFilter;

  const FiltersScreen(this.filters, this.currentFilter);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactos_Free = false;
  bool _vegan = false;
  bool _vegetrian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten']!;
    _lactos_Free = widget.currentFilter['lactose']!;
    _vegan = widget.currentFilter['vegan']!;
    _vegetrian = widget.currentFilter['vegetarian']!;

    super.initState();
  }

  Widget buildSwitchTile(
      String title, String subtitle, bool val, Function function) {
    return SwitchListTile(
      onChanged: (va) {
        function;
      },
      value: val,
      subtitle: Text(subtitle),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                activeColor: Colors.pinkAccent.withOpacity(0.8),
                onChanged: (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                },
                value: _glutenFree!,
                subtitle: Text('Only include gluten Free meals'),
                title: Text('Gluten Free'),
              ),
              SwitchListTile(
                activeColor: Colors.pinkAccent.withOpacity(0.8),
                onChanged: (value) {
                  setState(() {
                    _lactos_Free = value;
                  });
                },
                value: _lactos_Free!,
                subtitle: Text('Only include lactos Free meals'),
                title: Text('lactos Free'),
              ),
              SwitchListTile(
                activeColor: Colors.pinkAccent.withOpacity(0.8),
                onChanged: (value) {
                  setState(() {
                    _vegetrian = value;
                  });
                },
                value: _vegetrian!,
                subtitle: Text('Only include vegetrian meals'),
                title: Text('vegetrian'),
              ),
              SwitchListTile(
                activeColor: Colors.pinkAccent.withOpacity(0.8),
                onChanged: (value) {
                  setState(() {
                    _vegan = value;
                  });
                },
                value: _vegan!,
                subtitle: Text('Only include vegan meals'),
                title: Text('vegan'),
              ),
              SizedBox(
                height: size.height / 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90.0),
                child: Container(
                  height: size.height / 15,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    onPressed: () {
                      Map<String, bool> filtersSelected = {
                        'gluten': _glutenFree!,
                        'lactose': _lactos_Free!,
                        'vegan': _vegan!,
                        'vegetarian': _vegetrian!
                      };
                      widget.filters(filtersSelected);
                    },
                    child: const Text("Save"),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
      drawer: DrawerScreen(),
    );
  }
}
