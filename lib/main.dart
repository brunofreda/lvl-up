import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/main_tasks_page.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');
  
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LvL Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MainTasksPage(),
    );
  }
}
