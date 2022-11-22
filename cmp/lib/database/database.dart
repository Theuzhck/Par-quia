import 'package:cmp/resources/sql.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqLiteService {
  List items = [];
  static Future<Database> initDatabase() async {
    const String databaseName = "catalogo.db";
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return await openDatabase(path,
        version: SQLStrings.dbVersion,
        onCreate: (Database db, version) async => await createTables(db));
  }

  static Future<void> createTables(Database db) async {
    for (var sql in SQLStrings.createTablesSQL) {
      db.execute(sql);
    }
  }

  Future<List> getItems(String table) async {
    final db = await SqLiteService.initDatabase();
    try {
      final List<Map<String, Object?>> queryResult = await db.query(table);
      if (table == 'igreja') {
        items = queryResult;
      }
    } catch (error) {
      throw Exception(error.toString());
    }
    return items.toList();
    // return queryResult.map((e) => Note.fromMap(e)).toList();
  }

  Future getItem(String table, int? id) async {
    final db = await SqLiteService.initDatabase();
    return await db.query(table,
        columns: ['idIgreja'], where: 'idIgreja = ?', whereArgs: [id]);
    // return items.firstWhere((element) {
    //   print(element);
    //   return element['idIgreja'] == id;
    // });
  }

  static Future<int> createItem() async {
    final db = await SqLiteService.initDatabase();
    final id = await db.insert(
        'Usuario',
        {
          'idUsuario': 1,
          'primeiro_nome': 'Matheus',
          'sobrenome': 'Henrick'
        }, //list,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }
}
