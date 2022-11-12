import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import '../components/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SettingsScreen(this.settings, this.onSettingsChanged, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings = Settings();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settings = widget.settings;
  }

  Widget _creatSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: ((value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _creatSwitch(
                'Sem Glutén',
                'Só exibe refeições sem glutén',
                settings.isGlutenFree,
                (value) => setState(() => settings.isGlutenFree = value),
              ),
              _creatSwitch(
                'Sem Lactose',
                'Só exibe refeições sem lactose',
                settings.isLactoseFree,
                (value) => setState(() => settings.isLactoseFree = value),
              ),
              _creatSwitch(
                'Vegana',
                'Só exibe refeições veganas',
                settings.isVegan,
                (value) => setState(() => settings.isVegan = value),
              ),
              _creatSwitch(
                'Vegetariana',
                'Só exibe refeições vegetarianas',
                settings.isVegetarian,
                (value) => setState(() => settings.isVegetarian = value),
              )
            ],
          ))
        ],
      ),
    );
  }
}
