import '../utils/app_routes.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _creatItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomCenter,
            child: Text(
              'Vamos Cozinhar ?',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _creatItem(
            Icons.restaurant,
            'Refeições',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          _creatItem(
            Icons.settings,
            'Settings',
            () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
          ),
        ],
      ),
    );
  }
}
