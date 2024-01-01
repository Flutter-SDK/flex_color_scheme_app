import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Menu Page - Add menu options here.',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
