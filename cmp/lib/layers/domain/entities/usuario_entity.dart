import 'dart:ffi';

import 'package:cmp/layers/domain/entities/parish_entity.dart';

class User {
  String userName;
  DateTime lastConfession;
  Parish mainParish;
  Bool systemAdministrator;
  Bool userGuess;
  Bool parishAdministrator;
  User({
    required this.userName,
    required this.lastConfession,
    required this.mainParish,
    required this.systemAdministrator,
    required this.userGuess,
    required this.parishAdministrator,
  });
}
