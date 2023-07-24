import 'package:flutter/material.dart';

import 'pages/tasks_page.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MainTasksPage(title: 'LvL Up'),
    );
  }
}
