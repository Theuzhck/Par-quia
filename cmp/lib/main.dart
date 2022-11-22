import 'package:cmp/ui/usuarios/list_users_page.dart';
import 'package:cmp/ui/usuarios/modify_users_page.dart';
import 'package:flutter/material.dart';

import 'ui/igrejas/list_parish_page.dart';
import 'ui/igrejas/modify_parish_page.dart';

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
        ModifyParishPage.routeName: (context) => ModifyParishPage(
              title: 'Modificar Paróquia',
            ),
        ListUsersPage.routeName: (context) => const ListUsersPage(),
        ModifyUserPage.routeName: (context) =>
            const ModifyUserPage(title: 'Modificar Usuário'),
      },
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

// class MyApp extends StatefulWidget {
//   @override
//   _State createState() => _State();
// }

// class _State extends State<MyApp> {
//   bool isSwitched = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter - tutorialkart.com'),
//         ),
//         body: Center(
//           child: Switch(
//             value: isSwitched,
//             onChanged: (value) {
//               setState(() {
//                 isSwitched = value;
//                 print(isSwitched);
//               });
//             },
//             activeTrackColor: Colors.lightGreenAccent,
//             activeColor: Colors.green,
//           ),
//         ));
//   }
// }
