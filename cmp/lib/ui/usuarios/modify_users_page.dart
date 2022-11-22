import 'package:cmp/database/db_postgres.dart';
import 'package:cmp/models/user_model.dart';
import 'package:cmp/resources/sql.dart';
import 'package:cmp/ui/usuarios/list_users_page.dart';
import 'package:flutter/material.dart';

class ModifyUserPage extends StatefulWidget {
  const ModifyUserPage({Key? key, required this.title, this.item})
      : super(key: key);

  final String title;
  final UserModel? item;
  static const routeName = '/modify_user';

  @override
  State<ModifyUserPage> createState() => _ModifyUserPageState();
}

class _ModifyUserPageState extends State<ModifyUserPage> {
  late final db = DatabaseOnline();
  late var item = widget.item ?? UserModel();
  @override
  initState() {
    super.initState();
    db.initDatabaseConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              onChanged: (value) => item.primeiroNome = value,
              initialValue: item.primeiroNome,
              maxLines: 2,
              minLines: 1,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nome do Usuário',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              onChanged: (value) => item.sobrenome = value,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Sobrenome do Usuário',
              ),
              initialValue: item.sobrenome,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                var result;
                if (item.idUsuario != null) {
                  result = db.deleteUsuario(SQLStrings.usuarioTableName, item);
                }
                result.then(
                  (value) {
                    if (value >= 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListUsersPage(),
                        ),
                      );
                    }
                  },
                );
              },
              child: const Text('Apagar usuário'),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var result;
          if (item.idUsuario != null) {
            result = db.updateUsuario(SQLStrings.usuarioTableName, item);
          } else {
            result = db.putItem(
                SQLStrings.usuarioTableName, UserModel().toList(item));
          }
          result.then(
            (value) {
              if (value >= 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListUsersPage(),
                  ),
                );
              }
            },
          );
        },
        tooltip: 'Salvar Usuário',
        child: const Icon(Icons.check),
      ),
    );
  }
}
