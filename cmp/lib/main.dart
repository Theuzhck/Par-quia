import 'package:flutter/material.dart';

import 'ui/list_parish_page.dart';
import 'ui/modify_parish_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadê Minha Paróquia',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const ListParishPage(),
      routes: {
        ModifyParishPage.routeName: (context) => const ModifyParishPage(
              title: 'Modificar Paróquia',
              id: 0,
            )
      },
    );
  }
}
