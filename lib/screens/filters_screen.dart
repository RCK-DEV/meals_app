import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class FilterWrapper {
  bool _value = false;
  FilterWrapper(this._value);
  switchState() => _value = !_value;
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<Map<String, dynamic>> filters = [
    {
      'id': 'glutenFree',
      'title': 'Gluten-free',
      'subtitle': 'Only includes gluten-free meals.',
      'filter': FilterWrapper(false),
    },
    {
      'id': 'vegetarian',
      'title': 'Vegetarian',
      'subtitle': 'Only includes vegetarian meals.',
      'filter': FilterWrapper(false),
    },
    {
      'id': 'vegan',
      'title': 'Vegan',
      'subtitle': 'Only includes vegan meals.',
      'filter': FilterWrapper(false),
    },
    {
      'id': 'lactoseFree',
      'title': 'Lactose-free',
      'subtitle': 'Only includes lactose-free meals.',
      'filter': FilterWrapper(false),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your filters')),
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
            children: filters.map((filter) {
              return _buildSwitchListTile(
                filter['filter'],
                filter['title'],
                filter['subtitle'],
              );
            }).toList(),
            // children: [
            //   _buildSwitchListTile(_glutenFree, 'Gluten-free', 'Only includes gluten-free meals.'),
            // ],
          ))
        ],
      ),
    );
  }

  Widget _buildSwitchListTile(FilterWrapper filter, String title, String subtitle) {
    return SwitchListTile(
      value: filter._value,
      onChanged: (newBoolState) {
        setState(() => filter.switchState());
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
