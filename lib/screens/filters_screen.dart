import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import '../models/filter.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final List<Filter> _filters;
  final Function(List<Filter> filterData) _saveFilters;

  FiltersScreen(this._saveFilters, this._filters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class FilterWrapper {
  bool _value = false;
  FilterWrapper(this._value);
  switchState() => _value = !_value;
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
            onPressed: () {
              widget._saveFilters(widget._filters);
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              'Adjust meal selection.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: widget._filters.map((filter) {
              return _buildSwitchListTile(filter);
            }).toList(),
            // children: [
            //   _buildSwitchListTile(_glutenFree, 'Gluten-free', 'Only includes gluten-free meals.'),
            // ],
          ))
        ],
      ),
    );
  }

  Widget _buildSwitchListTile(Filter filter) {
    return SwitchListTile(
      value: filter.isEnabled,
      onChanged: (newBoolState) {
        setState(() => filter.isEnabled = !filter.isEnabled);
      },
      title: Text(filter.title),
      subtitle: Text(filter.subtitle),
    );
  }
}
