import 'package:flutter/material.dart';

class AllWidgetsPage extends StatelessWidget {
  const AllWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'All Widgets Page - Display all widgets here.',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
