import 'package:flutter/material.dart';

import 'tasks_page.dart';

void main() {
  runApp(const AppWidget());
}

// TODO: Colors
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LvL Up',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TasksPage(title: 'LvL Up'),
    );
  }
}
