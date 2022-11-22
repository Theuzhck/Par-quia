import 'package:cmp/ui/igrejas/list_parish_page.dart';
import 'package:cmp/ui/usuarios/list_users_page.dart';
import 'package:flutter/material.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 60),
          ListTile(
            leading: const Icon(Icons.church),
            title: const Text('Paróquias'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListParishPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle),
            title: const Text('Usuários'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListUsersPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
