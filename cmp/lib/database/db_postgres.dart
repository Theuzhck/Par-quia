import 'package:cmp/models/leader_model.dart';
import 'package:cmp/models/parish_model.dart';
import 'package:cmp/models/user_model.dart';
import 'package:cmp/resources/sql.dart';
import 'package:postgres/postgres.dart';

import 'package:cmp/database/sql_db.dart';

class DatabaseOnline {
  var databaseConnection = PostgreSQLConnection(StringDatabase.databaseHost,
      StringDatabase.databasePort, StringDatabase.databaseName,
      queryTimeoutInSeconds: 3600,
      timeoutInSeconds: 3600,
      username: StringDatabase.username,
      password: StringDatabase.password);

  Future initDatabaseConnection() async {
    await databaseConnection.open().then((value) {});
  }

  Future<int> updateUsuario(String tabela, UserModel user) async {
    String sql = '${SQLStrings.update} $tabela SET ';
    sql += 'primeiro_nome = \'${user.primeiroNome}\', ';
    sql += 'sobrenome = \'${user.sobrenome}\' ';
    sql += 'WHERE idusuario = ${user.idUsuario}';

    var result = await databaseConnection.query(sql);
    return result.affectedRowCount;
  }

  Future<int> deleteUsuario(String tabela, UserModel user) async {
    String sql = '${SQLStrings.delete} $tabela ';
    sql += 'WHERE idusuario = ${user.idUsuario}';

    var result = await databaseConnection.query(sql);
    return result.affectedRowCount;
  }

  Future<int> updateIgreja(String tabela, ParishModel igreja) async {
    String sql = '${SQLStrings.update} $tabela SET ';
    sql += 'nome = \'${igreja.nome}\', ';
    sql += 'secretaria = \'${igreja.secretaria}\', ';
    sql += 'matriz = \'${igreja.nome}\' ';
    sql += 'WHERE idigreja = ${igreja.idIgreja}';

    var result = await databaseConnection.query(sql);
    return result.affectedRowCount;
  }

  Future<int> deleteIgreja(String tabela, ParishModel igreja) async {
    String sql = '${SQLStrings.delete} $tabela ';
    sql += 'WHERE idIgreja = ${igreja.idIgreja}';

    var result = await databaseConnection.query(sql);
    return result.affectedRowCount;
  }

  Future<int> putItem(String tabela, List values) async {
    String sql = '${SQLStrings.insert} $tabela VALUES ';
    sql += '(';
    for (var i = 0; i < values.length; i++) {
      if (i != values.length - 1) {
        sql += '${values[i]}, ';
      } else {
        sql += '${values[i]}) ';
      }
    }

    var result = await databaseConnection.query(sql);
    return result.affectedRowCount;
  }

  Future<int> putLider(Map<String, dynamic> lead, int id, String nome) async {
    String sql = '${SQLStrings.insert} ${SQLStrings.liderTableName} VALUES ';
    sql += '(';
    for (var element in lead.entries) {
      if (element.value.runtimeType == String) {
        sql += '\'${element.value}\', ';
      } else {
        sql += '${element.value}, ';
      }
    }
    sql += '$id , \'$nome\') ';
    var result = await databaseConnection.query(sql);
    return result.affectedRowCount;
  }

  Future<List<dynamic>> get(String tabela) async {
    var items = [];
    try {
      var result = await databaseConnection.mappedResultsQuery(
        '${SQLStrings.select} $tabela',
      );
      if (result[0].isNotEmpty) {
        if (tabela.contains('igreja')) {
          for (var element in result) {
            items.add(ParishModel.fromJson(element));
          }
        }

        if (tabela.contains('usuario')) {
          for (var element in result) {
            items.add(UserModel.fromJson(element));
          }
        }
      }
    } catch (error) {
      throw Exception(error.toString());
    }
    return items;
  }

  Future<List<dynamic>> getItem(String tabela, int id, String? tabela2) async {
    tabela2 = tabela2?.split('.')[1];
    String sql =
        '${SQLStrings.select} $tabela WHERE id${tabela2 ?? tabela} = $id';
    var result = await databaseConnection.query(sql);
    var lead = [];
    for (var element in result) {
      lead.add(LeaderModel.listToJson(element));
    }
    return lead;
  }

  Future<List<dynamic>> getLider(int id) async {
    String sql =
        '${SQLStrings.select} ${SQLStrings.usuarioTableName} WHERE idusuario = $id';
    var result = await databaseConnection.query(sql);
    var lead = [];
    for (var element in result) {
      lead.add(UserModel.listToJson(element));
    }
    return lead;
  }
}
