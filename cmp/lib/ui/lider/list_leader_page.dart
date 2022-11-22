import 'package:cmp/database/db_postgres.dart';
import 'package:cmp/resources/sql.dart';
import 'package:cmp/ui/drawer.dart';
import 'package:flutter/material.dart';

import 'package:cmp/ui/igrejas/modify_parish_page.dart';

class ListParishPage extends StatefulWidget {
  const ListParishPage({Key? key}) : super(key: key);

  @override
  State<ListParishPage> createState() => _ListParishPageState();
}

class _ListParishPageState extends State<ListParishPage> {
  var _items = [];
  late final db = DatabaseOnline();
  @override
  void initState() {
    super.initState();
    db.initDatabaseConnection().then((value) {
      init();
    });
  }

  void init() async {
    db.get(SQLStrings.igrejaTableName).then((value) {
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
        title: const Text('Lista das Paróquias'),
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
                    builder: (context) => ModifyParishPage(
                        title: 'Modificar Paróquia', item: _items[index]),
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
                          _items[index].nome ?? "",
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
              builder: (context) => ModifyParishPage(title: 'Criar Paróquia'),
            ),
          );
        },
        tooltip: 'Adicionar Paróquia',
        child: const Icon(Icons.add),
      ),
    );
  }
}
