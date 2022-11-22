import 'package:cmp/database/db_postgres.dart';
import 'package:cmp/resources/sql.dart';
import 'package:cmp/ui/drawer.dart';
import 'package:cmp/ui/usuarios/modify_users_page.dart';
import 'package:flutter/material.dart';

class ListUsersPage extends StatefulWidget {
  const ListUsersPage({Key? key}) : super(key: key);
  static const routeName = '/list_users';

  @override
  State<ListUsersPage> createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  List _items = [];
  late final db = DatabaseOnline();
  @override
  void initState() {
    super.initState();
    db.initDatabaseConnection().then((value) {
      init();
    });
  }

  void init() async {
    db.get(SQLStrings.usuarioTableName).then((value) {
      setState(() {
        _items = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Lista dos Usuários'),
      ),
      drawer: const DrawerMenuWidget(),
      body: Center(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModifyUserPage(
                        title: 'Modificar Usuário', item: _items[index]),
                  ),
                ),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                            child: Text(
                          '${_items[index].primeiroNome}  ${_items[index].sobrenome}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 15.0),
                        )),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const ModifyUserPage(title: 'Criar Usuário'),
            ),
          );
        },
        tooltip: 'Criar Usuário',
        child: const Icon(Icons.add),
      ),
    );
  }
}
