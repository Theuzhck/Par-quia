import 'dart:convert';

import 'package:cmp/ui/modify_parish_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListParishPage extends StatefulWidget {
  const ListParishPage({Key? key}) : super(key: key);

  @override
  State<ListParishPage> createState() => _ListParishPageState();
}

class _ListParishPageState extends State<ListParishPage> {
  @override
  void initState() {
    super.initState();
    readJson();
  }

  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('lib/assets/data/database-test.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: const Text('Lista das Paróquias'),
      ),
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
                        title: 'Modificar Paróquia',
                        id: int.parse(_items[index]["id"])),
                  ),
                ),
                child: Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                              child: Text(
                            _items[index]["paroquia"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 15.0),
                          )),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Image.asset(
                          'lib/assets/images/arrow-down.png',
                        ),
                      ],
                    ),
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
                  const ModifyParishPage(title: 'Criar Paróquia', id: 0),
            ),
          );
        },
        tooltip: 'Adicionar Paróquia',
        child: const Icon(Icons.add),
      ),
    );
  }
}
