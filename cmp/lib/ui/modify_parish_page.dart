import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ModifyParishPage extends StatefulWidget {
  const ModifyParishPage({Key? key, required this.title, required this.id})
      : super(key: key);

  final String title;
  final int id;
  static const routeName = '/modify_parish';

  @override
  State<ModifyParishPage> createState() => _ModifyParishPageState();
}

class _ModifyParishPageState extends State<ModifyParishPage> {
  @override
  void initState() {
    super.initState();
    readJson();
  }

  List _items = [];

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
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                initialValue: _items[widget.id]["paroquia"],
                maxLines: 2,
                minLines: 1,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nome da Paróquia',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nome da Arquidiocese',
                ),
                initialValue: _items[widget.id]["arquidiocese"],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nome do Vicariato',
                ),
                initialValue: _items[widget.id]["vicariato"],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nome da Forania',
                ),
                initialValue: _items[widget.id]["forania"],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nome do Pároco',
                ),
                initialValue: _items[widget.id]["paroco"],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nome do Vigário',
                ),
                initialValue: _items[widget.id]["vigario"],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Endereço da Paróquia',
                ),
                initialValue: _items[widget.id]["endereco"],
                maxLines: 2,
                minLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Telefone da Paróquia',
                ),
                initialValue: _items[widget.id]["telefone"],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'E-mail da Paróquia',
                ),
                initialValue: _items[widget.id]["email"],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Instagram da Paróquia',
                ),
                initialValue: _items[widget.id]["instagram"],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Facebook da Paróquia',
                ),
                initialValue: _items[widget.id]["facebook"],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Youtube da Paróquia',
                ),
                initialValue: _items[widget.id]["youtube"],
              ),
            ),
          ]),
        ));
  }
}
