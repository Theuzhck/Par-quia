import 'package:cmp/database/db_postgres.dart';
import 'package:cmp/models/parish_model.dart';
import 'package:cmp/resources/sql.dart';
import 'package:cmp/ui/igrejas/list_parish_page.dart';
import 'package:flutter/material.dart';

class ModifyParishPage extends StatefulWidget {
  ModifyParishPage({Key? key, required this.title, this.item})
      : super(key: key);

  final String title;
  final ParishModel? item;
  var isSwitched = false;
  static const routeName = '/modify_parish';

  @override
  State<ModifyParishPage> createState() => _ModifyParishPageState();
}

class _ModifyParishPageState extends State<ModifyParishPage> {
  late final db = DatabaseOnline();
  late var item = widget.item ?? ParishModel();
  var newLead = {'id': 0, 'date': 21 / 11 / 2022, 'status': false, 'tempo': ''};
  late List<dynamic> lideres = [];
  late List<dynamic> liderancas = [];
  @override
  initState() {
    super.initState();
    db.initDatabaseConnection().then((value) {
      var result = db.getItem(SQLStrings.liderTableName, widget.item!.idIgreja!,
          SQLStrings.igrejaTableName);
      result.then(
        (value) async {
          liderancas = value;
          for (var element in liderancas) {
            lideres.add(await db.getLider(element.idLider));
          }
          setState(() {});
        },
      );
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
              onChanged: (value) => item.nome = value,
              initialValue: item.nome,
              maxLines: 2,
              minLines: 1,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nome da Paróquia',
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: UnderlineInputBorder(),
          //       labelText: 'Nome da Arquidiocese',
          //     ),
          //     initialValue: item?.arquidiocese,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: UnderlineInputBorder(),
          //       labelText: 'Nome do Vicariato',
          //     ),
          //     initialValue: item?.vicariato,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: UnderlineInputBorder(),
          //       labelText: 'Nome da Forania',
          //     ),
          //     initialValue: item?.forania,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: UnderlineInputBorder(),
          //       labelText: 'Nome do Pároco',
          //     ),
          //     initialValue: item?.paroco,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: UnderlineInputBorder(),
          //       labelText: 'Nome do Vigário',
          //     ),
          //     initialValue: item?.vigario,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: UnderlineInputBorder(),
          //       labelText: 'Endereço da Paróquia',
          //     ),
          //     initialValue: item?.endereco,
          //     maxLines: 2,
          //     minLines: 1,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: UnderlineInputBorder(),
          //       labelText: 'Telefone da Paróquia',
          //     ),
          //     initialValue: item?.telefone,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: UnderlineInputBorder(),
          //       labelText: 'E-mail da Paróquia',
          //     ),
          //     initialValue: item?.email,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: UnderlineInputBorder(),
          //       labelText: 'Instagram da Paróquia',
          //     ),
          //     initialValue: item?.instagram,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: UnderlineInputBorder(),
          //       labelText: 'Facebook da Paróquia',
          //     ),
          //     initialValue: item?.facebook,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: UnderlineInputBorder(),
          //       labelText: 'Youtube da Paróquia',
          //     ),
          //     initialValue: item?.youtube,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              onChanged: (value) => item.secretaria = value,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Secretaria da Paróquia',
              ),
              initialValue: item.secretaria,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: liderancas.isEmpty
                  ? OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {
                        var result;
                        if (item.idIgreja != null) {
                          result =
                              db.deleteIgreja(SQLStrings.igrejaTableName, item);
                        }
                        result.then(
                          (value) {
                            if (value >= 1) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ListParishPage(),
                                ),
                              );
                            }
                          },
                        );
                      },
                      child: const Text('Apagar Igreja'),
                    )
                  : OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: null,
                      child: const Text('Apagar Igreja'))),
          const SizedBox(height: 50),
          const Center(
            child: Text('Histórico de Líderes'),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Líder')),
                  DataColumn(label: Text('Igreja')),
                  DataColumn(label: Text('Status'))
                ],
                rows: liderancas.isNotEmpty
                    ? liderancas
                        .map((element) => DataRow(cells: [
                              DataCell(Text(
                                  '${lideres[0][0].primeiroNome} ${lideres[0][0].sobrenome}')),
                              DataCell(Text(element.nomeIgreja)),
                              DataCell(Text(element.status == 'ativo'
                                  ? 'Ativo'
                                  : "Não ativo")),
                            ]))
                        .toList()
                    : [
                        const DataRow(cells: [
                          DataCell(Text('')),
                          DataCell(Text('Sem dados')),
                          DataCell(Text(''))
                        ])
                      ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        title: const Text('Adicionar líder'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  onChanged: (value) =>
                                      newLead['id'] = int.parse(value),
                                  decoration: const InputDecoration(
                                    labelText: 'Id do Líder',
                                  ),
                                ),
                                TextFormField(
                                  onChanged: (value) => newLead['date'] = value,
                                  decoration: const InputDecoration(
                                    labelText: 'Data de início',
                                  ),
                                ),
                                TextFormField(
                                  onChanged: (value) =>
                                      newLead['tempo'] = value,
                                  decoration: const InputDecoration(
                                    labelText: 'Tempo de permanência',
                                  ),
                                ),
                                TextFormField(
                                  onChanged: (value) => value.isEmpty
                                      ? newLead['status'] = false
                                      : newLead['status'] = true,
                                  decoration: const InputDecoration(
                                    labelText: 'Status',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          OutlinedButton(
                              child: const Text("Enviar"),
                              onPressed: () {
                                var result = db.putLider(newLead,
                                    widget.item!.idIgreja!, widget.item!.nome!);
                                result.then(
                                  (value) {
                                    if (value >= 1) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ListParishPage(),
                                        ),
                                      );
                                    }
                                  },
                                );
                              })
                        ],
                      );
                    });
              },
              child: const Text('Adicionar líder'),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var result;
          if (item.idIgreja != null) {
            result = db.updateIgreja(SQLStrings.igrejaTableName, item);
          } else {
            result = db.putItem(
                SQLStrings.igrejaTableName, ParishModel().toList(item));
          }
          result.then(
            (value) {
              if (value >= 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListParishPage(),
                  ),
                );
              }
            },
          );
        },
        tooltip: 'Salvar Paróquia',
        child: const Icon(Icons.check),
      ),
    );
  }
}
