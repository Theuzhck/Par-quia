import 'dart:ffi';

import 'package:cmp/models/parish_model.dart';

class UserEntity {
  String userName;
  DateTime lastConfession;
  // ParishEntity mainParish;
  Bool systemAdministrator;
  Bool userGuess;
  Bool parishAdministrator;
  UserEntity({
    required this.userName,
    required this.lastConfession,
    // required this.mainParish,
    required this.systemAdministrator,
    required this.userGuess,
    required this.parishAdministrator,
  });
}
